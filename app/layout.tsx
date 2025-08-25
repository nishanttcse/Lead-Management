import type React from "react"
import type { Metadata } from "next"
import { GeistSans } from "geist/font/sans"
import { GeistMono } from "geist/font/mono"
import "./globals.css"

export const metadata: Metadata = {
  title: "Lead Management System - Professional CRM Solution",
  description:
    "A comprehensive lead management system built with Next.js, Supabase, and modern web technologies. Manage leads, track conversions, and grow your business.",
  generator: "lEADSAPP",
  keywords: "lead management, CRM, sales, business, Next.js, Supabase",
  authors: [{ name: "Lead Management System" }],
  openGraph: {
    title: "Lead Management System",
    description: "Professional lead management and CRM solution",
    type: "website",
  },
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="en">
      <head>
        <style>{`
html {
  font-family: ${GeistSans.style.fontFamily};
  --font-sans: ${GeistSans.variable};
  --font-mono: ${GeistMono.variable};
}
        `}</style>
      </head>
      <body>{children}</body>
    </html>
  )
}
