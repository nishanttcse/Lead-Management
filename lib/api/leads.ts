import type { LeadCreateInput, LeadUpdateInput, LeadsResponse, LeadResponse, LeadFilters } from "@/lib/types/lead"

const API_BASE = "/api/leads"

export class LeadsAPI {
  static async getLeads(filters: LeadFilters = {}): Promise<LeadsResponse> {
    const params = new URLSearchParams()

    Object.entries(filters).forEach(([key, value]) => {
      if (value !== undefined && value !== null && value !== "") {
        params.append(key, value.toString())
      }
    })

    const response = await fetch(`${API_BASE}?${params.toString()}`)

    if (!response.ok) {
      const error = await response.json()
      throw new Error(error.error || "Failed to fetch leads")
    }

    return response.json()
  }

  static async getLead(id: string): Promise<LeadResponse> {
    const response = await fetch(`${API_BASE}/${id}`)

    if (!response.ok) {
      const error = await response.json()
      throw new Error(error.error || "Failed to fetch lead")
    }

    return response.json()
  }

  static async createLead(lead: LeadCreateInput): Promise<LeadResponse> {
    const response = await fetch(API_BASE, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(lead),
    })

    if (!response.ok) {
      const error = await response.json()
      throw new Error(error.error || "Failed to create lead")
    }

    return response.json()
  }

  static async updateLead(id: string, lead: LeadUpdateInput): Promise<LeadResponse> {
    const response = await fetch(`${API_BASE}/${id}`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(lead),
    })

    if (!response.ok) {
      const error = await response.json()
      throw new Error(error.error || "Failed to update lead")
    }

    return response.json()
  }

  static async deleteLead(id: string): Promise<void> {
    const response = await fetch(`${API_BASE}/${id}`, {
      method: "DELETE",
    })

    if (!response.ok) {
      const error = await response.json()
      throw new Error(error.error || "Failed to delete lead")
    }
  }
}
