# Lead Management System - Deployment Guide

## 🚀 Public Deployment Instructions

### Prerequisites
- Supabase account and project
- Vercel account (for deployment)
- Git repository

### 1. Database Setup
Run these SQL scripts in your Supabase SQL Editor in order:

1. **Create Users Table**: Run `scripts/001_create_users_table.sql`
2. **Create Leads Table**: Run `scripts/002_create_leads_table.sql`  
3. **Create Triggers**: Run `scripts/003_create_updated_at_trigger.sql`
4. **Seed Test Data**: Run `scripts/004_seed_test_data.sql`

### 2. Environment Variables
Set these in your deployment platform:

\`\`\`env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
NEXT_PUBLIC_SITE_URL=https://your-deployed-app.vercel.app
\`\`\`

### 3. Supabase Configuration
In your Supabase project settings:

1. **Authentication > URL Configuration**:
   - Site URL: `https://your-deployed-app.vercel.app`
   - Redirect URLs: `https://your-deployed-app.vercel.app/**`

2. **Authentication > Email Templates**:
   - Confirm signup: `https://your-deployed-app.vercel.app/auth/callback`

### 4. Deploy to Vercel
1. Connect your Git repository to Vercel
2. Add environment variables in Vercel dashboard
3. Deploy the application

## 🧪 Test Credentials

After running the seed script, use these credentials to test:

**Email**: `test@leadmanager.com`
**Password**: `TestPassword123!`

This test account includes:
- ✅ 120 sample leads across different industries
- ✅ Various lead statuses (new, contacted, qualified, lost)
- ✅ Multiple lead sources (website, referral, social media, advertisement)
- ✅ Realistic company names, contacts, and notes
- ✅ Spread across 120 days of historical data

## 📊 Features Available for Testing

1. **Authentication System**
   - User registration and login
   - Email confirmation flow
   - Protected routes

2. **Lead Management**
   - View all leads in paginated table
   - Create new leads
   - Edit existing leads
   - Delete leads
   - Search and filter functionality

3. **Dashboard Analytics**
   - Lead statistics by status
   - Conversion metrics
   - Recent activity

4. **Data Operations**
   - Server-side pagination (10 leads per page)
   - Multi-field search (name, email, company)
   - Filter by status and source
   - Real-time updates

## 🔗 API Endpoints

All REST endpoints are publicly accessible:

- `GET /api/leads` - List leads with pagination/filtering
- `POST /api/leads` - Create new lead
- `GET /api/leads/[id]` - Get specific lead
- `PUT /api/leads/[id]` - Update lead
- `DELETE /api/leads/[id]` - Delete lead

## ✅ End-to-End Testing Checklist

1. ✅ Register new account
2. ✅ Login with test credentials
3. ✅ View dashboard with 120+ leads
4. ✅ Test pagination (12 pages of leads)
5. ✅ Search leads by name/email/company
6. ✅ Filter by status and source
7. ✅ Create new lead
8. ✅ Edit existing lead
9. ✅ Delete lead
10. ✅ View lead statistics
11. ✅ Test responsive design
12. ✅ Logout functionality

The application is now ready for public deployment and testing!
