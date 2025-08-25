# Lead Management System

A comprehensive full-stack Lead Management System built with Next.js, Supabase, and TypeScript. This application provides a complete solution for managing leads, tracking conversions, and analyzing sales performance with authentication, CRUD operations, and advanced filtering capabilities.

## Features

### 🔐 Authentication System
- JWT-based authentication with httpOnly cookies
- User registration and login
- Email confirmation flow
- Protected routes with middleware
- Session management

### 📊 Lead Management
- Complete CRUD operations for leads
- Server-side pagination
- Advanced filtering by status and source
- Multi-field search functionality
- Real-time statistics dashboard
- Lead status tracking (new, contacted, qualified, lost)
- Source tracking (website, referral, social_media, advertisement)

### 🎨 Professional UI/UX
- Modern, responsive design
- Emerald color scheme with semantic design tokens
- Dashboard with analytics cards
- Data table with search and filtering
- Modal forms for creating/editing leads
- Mobile-responsive layout

### 🔒 Security Features
- Row Level Security (RLS) policies
- User data isolation
- Input validation and sanitization
- Protected API endpoints

## Tech Stack

- **Frontend**: Next.js 15, React, TypeScript
- **Backend**: Next.js API Routes
- **Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth
- **Styling**: Tailwind CSS v4
- **UI Components**: shadcn/ui
- **Deployment**: Vercel

## Quick Start

### Prerequisites
- Node.js 18+ 
- npm or yarn
- Supabase account

### 1. Clone the Repository
\`\`\`bash
git clone <repository-url>
cd lead-management-system
\`\`\`

### 2. Install Dependencies
\`\`\`bash
npm install
# or
yarn install
\`\`\`

### 3. Environment Setup
Create a `.env.local` file in the root directory:

\`\`\`env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
NEXT_PUBLIC_SITE_URL=http://localhost:3000
NEXT_PUBLIC_DEV_SUPABASE_REDIRECT_URL=http://localhost:3000
\`\`\`

### 4. Database Setup
Run the following SQL scripts in your Supabase SQL Editor in order:

1. **Create Users Table**:
\`\`\`sql
-- Copy and paste the content from scripts/001_create_users_table.sql
\`\`\`

2. **Create Leads Table**:
\`\`\`sql
-- Copy and paste the content from scripts/002_create_leads_table.sql
\`\`\`

3. **Create Triggers**:
\`\`\`sql
-- Copy and paste the content from scripts/003_create_updated_at_trigger.sql
\`\`\`

### 5. Run the Application
\`\`\`bash
npm run dev
# or
yarn dev
\`\`\`

Visit `http://localhost:3000` to access the application.

## Database Schema

### Users Table
- `id` (UUID, Primary Key) - References auth.users
- `email` (Text, Not Null)
- `full_name` (Text)
- `created_at` (Timestamp)
- `updated_at` (Timestamp)

### Leads Table
- `id` (UUID, Primary Key)
- `name` (Text, Not Null)
- `email` (Text, Not Null)
- `phone` (Text, Optional)
- `company` (Text, Optional)
- `status` (Enum: new, contacted, qualified, lost)
- `source` (Enum: website, referral, social_media, advertisement)
- `notes` (Text, Optional)
- `created_at` (Timestamp)
- `updated_at` (Timestamp)
- `user_id` (UUID, Foreign Key)

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `POST /api/auth/logout` - User logout

### Leads Management
- `GET /api/leads` - Get all leads (with pagination and filtering)
- `POST /api/leads` - Create a new lead
- `GET /api/leads/[id]` - Get a specific lead
- `PUT /api/leads/[id]` - Update a lead
- `DELETE /api/leads/[id]` - Delete a lead

### Query Parameters for GET /api/leads
- `page` - Page number (default: 1)
- `limit` - Items per page (default: 10)
- `search` - Search across name, email, and company
- `status` - Filter by lead status
- `source` - Filter by lead source

## Usage

### 1. Register/Login
- Navigate to `/auth/register` to create a new account
- Or use `/auth/login` to sign in with existing credentials
- Check your email for confirmation if required

### 2. Dashboard
- Access the main dashboard at `/dashboard`
- View lead statistics and analytics
- See total leads, qualified leads, conversion rate, and lost leads

### 3. Managing Leads
- **Create**: Click "Add Lead" button to create new leads
- **View**: Browse leads in the data table with pagination
- **Search**: Use the search bar to find specific leads
- **Filter**: Filter by status (new, contacted, qualified, lost) or source
- **Edit**: Click the edit icon in the Actions column
- **Delete**: Click the delete icon in the Actions column

### 4. Lead Status Workflow
1. **New** - Freshly added leads
2. **Contacted** - Leads that have been reached out to
3. **Qualified** - Leads that show potential for conversion
4. **Lost** - Leads that are no longer viable

## Deployment

### Deploy to Vercel
1. Push your code to GitHub
2. Connect your repository to Vercel
3. Add environment variables in Vercel dashboard
4. Deploy automatically

### Environment Variables for Production
\`\`\`env
NEXT_PUBLIC_SUPABASE_URL=your_production_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_production_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_production_service_role_key
NEXT_PUBLIC_SITE_URL=https://your-domain.vercel.app
\`\`\`

## Security Considerations

- All API endpoints require authentication
- Row Level Security (RLS) ensures users only access their own data
- Input validation on both client and server side
- Secure cookie-based session management
- Environment variables for sensitive data

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository.
