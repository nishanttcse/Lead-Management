import { createClient } from "@/lib/supabase/server"
import { type NextRequest, NextResponse } from "next/server"

// GET /api/leads/[id] - Get a specific lead
export async function GET(request: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  try {
    const { id } = await params
    const supabase = await createClient()

    // Check authentication
    const {
      data: { user },
      error: authError,
    } = await supabase.auth.getUser()
    if (authError || !user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 })
    }

    const { data: lead, error } = await supabase.from("leads").select("*").eq("id", id).eq("user_id", user.id).single()

    if (error) {
      if (error.code === "PGRST116") {
        // No rows returned
        return NextResponse.json({ error: "Lead not found" }, { status: 404 })
      }
      console.error("Database error:", error)
      return NextResponse.json({ error: "Failed to fetch lead" }, { status: 500 })
    }

    return NextResponse.json({ data: lead })
  } catch (error) {
    console.error("API error:", error)
    return NextResponse.json({ error: "Internal server error" }, { status: 500 })
  }
}

// PUT /api/leads/[id] - Update a specific lead
export async function PUT(request: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  try {
    const { id } = await params
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

    // Update lead
    const { data: lead, error } = await supabase
      .from("leads")
      .update({
        name,
        email,
        phone: phone || null,
        company: company || null,
        status: status || "new",
        source,
        notes: notes || null,
      })
      .eq("id", id)
      .eq("user_id", user.id)
      .select()
      .single()

    if (error) {
      if (error.code === "PGRST116") {
        // No rows returned
        return NextResponse.json({ error: "Lead not found" }, { status: 404 })
      }
      if (error.code === "23505") {
        // Unique constraint violation
        return NextResponse.json({ error: "A lead with this email already exists" }, { status: 409 })
      }
      console.error("Database error:", error)
      return NextResponse.json({ error: "Failed to update lead" }, { status: 500 })
    }

    return NextResponse.json({ data: lead })
  } catch (error) {
    console.error("API error:", error)
    return NextResponse.json({ error: "Internal server error" }, { status: 500 })
  }
}

// DELETE /api/leads/[id] - Delete a specific lead
export async function DELETE(request: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  try {
    const { id } = await params
    const supabase = await createClient()

    // Check authentication
    const {
      data: { user },
      error: authError,
    } = await supabase.auth.getUser()
    if (authError || !user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 })
    }

    const { error } = await supabase.from("leads").delete().eq("id", id).eq("user_id", user.id)

    if (error) {
      console.error("Database error:", error)
      return NextResponse.json({ error: "Failed to delete lead" }, { status: 500 })
    }

    return NextResponse.json({ message: "Lead deleted successfully" })
  } catch (error) {
    console.error("API error:", error)
    return NextResponse.json({ error: "Internal server error" }, { status: 500 })
  }
}
