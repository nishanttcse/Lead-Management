import { createClient } from "@/lib/supabase/server"
import { type NextRequest, NextResponse } from "next/server"

// GET /api/leads - Get all leads with pagination and filtering
export async function GET(request: NextRequest) {
  try {
    const supabase = await createClient()

    // Check authentication
    const {
      data: { user },
      error: authError,
    } = await supabase.auth.getUser()
    if (authError || !user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 })
    }

    const { searchParams } = new URL(request.url)

    // Pagination parameters
    const page = Number.parseInt(searchParams.get("page") || "1")
    const limit = Number.parseInt(searchParams.get("limit") || "10")
    const offset = (page - 1) * limit

    // Filter parameters
    const status = searchParams.get("status")
    const source = searchParams.get("source")
    const search = searchParams.get("search")
    const sortBy = searchParams.get("sortBy") || "created_at"
    const sortOrder = searchParams.get("sortOrder") || "desc"

    // Build query
    let query = supabase.from("leads").select("*", { count: "exact" }).eq("user_id", user.id)

    // Apply filters
    if (status) {
      query = query.eq("status", status)
    }
    if (source) {
      query = query.eq("source", source)
    }
    if (search) {
      query = query.or(`name.ilike.%${search}%,email.ilike.%${search}%,company.ilike.%${search}%`)
    }

    // Apply sorting and pagination
    query = query.order(sortBy, { ascending: sortOrder === "asc" }).range(offset, offset + limit - 1)

    const { data: leads, error, count } = await query

    if (error) {
      console.error("Database error:", error)
      return NextResponse.json({ error: "Failed to fetch leads" }, { status: 500 })
    }

    // Calculate pagination metadata
    const totalPages = Math.ceil((count || 0) / limit)
    const hasNextPage = page < totalPages
    const hasPreviousPage = page > 1

    return NextResponse.json({
      data: leads,
      pagination: {
        page,
        limit,
        total: count || 0,
        totalPages,
        hasNextPage,
        hasPreviousPage,
      },
    })
  } catch (error) {
    console.error("API error:", error)
    return NextResponse.json({ error: "Internal server error" }, { status: 500 })
  }
}

// POST /api/leads - Create a new lead
export async function POST(request: NextRequest) {
  try {
    const supabase = await createClient()

    // Check authentication
    const {
      data: { user },
      error: authError,
    } = await supabase.auth.getUser()
    if (authError || !user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 })
    }

    const body = await request.json()
    const { name, email, phone, company, status, source, notes } = body

    // Validate required fields
    if (!name || !email || !source) {
      return NextResponse.json({ error: "Name, email, and source are required" }, { status: 400 })
    }

    // Validate email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    if (!emailRegex.test(email)) {
      return NextResponse.json({ error: "Invalid email format" }, { status: 400 })
    }

    // Validate enum values
    const validStatuses = ["new", "contacted", "qualified", "lost"]
    const validSources = ["website", "referral", "social_media", "advertisement"]

    if (status && !validStatuses.includes(status)) {
      return NextResponse.json({ error: "Invalid status value" }, { status: 400 })
    }

    if (!validSources.includes(source)) {
      return NextResponse.json({ error: "Invalid source value" }, { status: 400 })
    }

    // Create lead
    const { data: lead, error } = await supabase
      .from("leads")
      .insert({
        name,
        email,
        phone: phone || null,
        company: company || null,
        status: status || "new",
        source,
        notes: notes || null,
        user_id: user.id,
      })
      .select()
      .single()

    if (error) {
      if (error.code === "23505") {
        // Unique constraint violation
        return NextResponse.json({ error: "A lead with this email already exists" }, { status: 409 })
      }
      console.error("Database error:", error)
      return NextResponse.json({ error: "Failed to create lead" }, { status: 500 })
    }

    return NextResponse.json({ data: lead }, { status: 201 })
  } catch (error) {
    console.error("API error:", error)
    return NextResponse.json({ error: "Internal server error" }, { status: 500 })
  }
}
