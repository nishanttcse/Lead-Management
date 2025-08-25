export interface Lead {
  id: string
  name: string
  email: string
  phone?: string
  company?: string
  status: "new" | "contacted" | "qualified" | "lost"
  source: "website" | "referral" | "social_media" | "advertisement"
  notes?: string
  created_at: string
  updated_at: string
  user_id: string
}

export interface LeadCreateInput {
  name: string
  email: string
  phone?: string
  company?: string
  status?: "new" | "contacted" | "qualified" | "lost"
  source: "website" | "referral" | "social_media" | "advertisement"
  notes?: string
}

export interface LeadUpdateInput extends LeadCreateInput {}

export interface LeadsResponse {
  data: Lead[]
  pagination: {
    page: number
    limit: number
    total: number
    totalPages: number
    hasNextPage: boolean
    hasPreviousPage: boolean
  }
}

export interface LeadResponse {
  data: Lead
}

export interface LeadFilters {
  status?: string
  source?: string
  search?: string
  sortBy?: string
  sortOrder?: "asc" | "desc"
  page?: number
  limit?: number
}
