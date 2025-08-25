"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Users, UserCheck, UserX, TrendingUp } from "lucide-react"
import { useEffect, useState } from "react"
import { LeadsAPI } from "@/lib/api/leads"

interface StatsData {
  total: number
  new: number
  contacted: number
  qualified: number
  lost: number
}

export function DashboardStats() {
  const [stats, setStats] = useState<StatsData>({
    total: 0,
    new: 0,
    contacted: 0,
    qualified: 0,
    lost: 0,
  })
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    const fetchStats = async () => {
      try {
        // Fetch leads for each status to calculate stats
        const [allLeads, newLeads, contactedLeads, qualifiedLeads, lostLeads] = await Promise.all([
          LeadsAPI.getLeads({ limit: 1000 }),
          LeadsAPI.getLeads({ status: "new", limit: 1000 }),
          LeadsAPI.getLeads({ status: "contacted", limit: 1000 }),
          LeadsAPI.getLeads({ status: "qualified", limit: 1000 }),
          LeadsAPI.getLeads({ status: "lost", limit: 1000 }),
        ])

        setStats({
          total: allLeads.pagination.total,
          new: newLeads.pagination.total,
          contacted: contactedLeads.pagination.total,
          qualified: qualifiedLeads.pagination.total,
          lost: lostLeads.pagination.total,
        })
      } catch (error) {
        console.error("Failed to fetch stats:", error)
      } finally {
        setIsLoading(false)
      }
    }

    fetchStats()
  }, [])

  const conversionRate = stats.total > 0 ? ((stats.qualified / stats.total) * 100).toFixed(1) : "0"

  return (
    <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
      <Card>
        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
          <CardTitle className="text-sm font-medium">Total Leads</CardTitle>
          <Users className="h-4 w-4 text-muted-foreground" />
        </CardHeader>
        <CardContent>
          <div className="text-2xl font-bold text-foreground">{isLoading ? "..." : stats.total}</div>
          <p className="text-xs text-muted-foreground">{stats.new} new this period</p>
        </CardContent>
      </Card>

      <Card>
        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
          <CardTitle className="text-sm font-medium">Qualified Leads</CardTitle>
          <UserCheck className="h-4 w-4 text-muted-foreground" />
        </CardHeader>
        <CardContent>
          <div className="text-2xl font-bold text-foreground">{isLoading ? "..." : stats.qualified}</div>
          <p className="text-xs text-muted-foreground">{stats.contacted} contacted</p>
        </CardContent>
      </Card>

      <Card>
        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
          <CardTitle className="text-sm font-medium">Conversion Rate</CardTitle>
          <TrendingUp className="h-4 w-4 text-muted-foreground" />
        </CardHeader>
        <CardContent>
          <div className="text-2xl font-bold text-foreground">{isLoading ? "..." : `${conversionRate}%`}</div>
          <p className="text-xs text-muted-foreground">From total leads</p>
        </CardContent>
      </Card>

      <Card>
        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
          <CardTitle className="text-sm font-medium">Lost Leads</CardTitle>
          <UserX className="h-4 w-4 text-muted-foreground" />
        </CardHeader>
        <CardContent>
          <div className="text-2xl font-bold text-foreground">{isLoading ? "..." : stats.lost}</div>
          <p className="text-xs text-muted-foreground">Requires follow-up</p>
        </CardContent>
      </Card>
    </div>
  )
}
