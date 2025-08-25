-- Create leads table with all required fields and constraints

-- Create enum types for status and source
create type lead_status as enum ('new', 'contacted', 'qualified', 'lost');
create type lead_source as enum ('website', 'referral', 'social_media', 'advertisement');

create table if not exists public.leads (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text not null,
  phone text,
  company text,
  status lead_status not null default 'new',
  source lead_source not null,
  notes text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  user_id uuid not null references public.users(id) on delete cascade,
  
  -- Add unique constraint on email per user
  unique(email, user_id)
);

-- Enable RLS
alter table public.leads enable row level security;

-- Create policies for leads table - users can only access their own leads
create policy "leads_select_own"
  on public.leads for select
  using (auth.uid() = user_id);

create policy "leads_insert_own"
  on public.leads for insert
  with check (auth.uid() = user_id);

create policy "leads_update_own"
  on public.leads for update
  using (auth.uid() = user_id);

create policy "leads_delete_own"
  on public.leads for delete
  using (auth.uid() = user_id);

-- Create indexes for better performance
create index if not exists leads_user_id_idx on public.leads(user_id);
create index if not exists leads_email_idx on public.leads(email);
create index if not exists leads_status_idx on public.leads(status);
create index if not exists leads_source_idx on public.leads(source);
create index if not exists leads_created_at_idx on public.leads(created_at desc);
