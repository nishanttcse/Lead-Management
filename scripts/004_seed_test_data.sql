-- Fixed all duplicate email addresses to ensure uniqueness
-- Seed script to create test user and 120+ leads for demonstration

-- First, let's create a test user in auth.users (this simulates user registration)
-- Note: In production, you would register through the UI, but for seeding we'll insert directly

-- Insert test user into auth.users (Supabase auth table)
INSERT INTO auth.users (
  id,
  instance_id,
  email,
  encrypted_password,
  email_confirmed_at,
  created_at,
  updated_at,
  confirmation_token,
  email_change,
  email_change_token_new,
  recovery_token
) VALUES (
  '550e8400-e29b-41d4-a716-446655440000'::uuid,
  '00000000-0000-0000-0000-000000000000'::uuid,
  'nish2forsri@gmail.com',
  crypt('abcd1234@', gen_salt('bf')), -- Password: abcd1234@
  now(),
  now(),
  now(),
  '',
  '',
  '',
  ''
) ON CONFLICT (id) DO NOTHING;

-- Insert corresponding user profile
INSERT INTO public.users (
  id,
  email,
  full_name,
  created_at,
  updated_at
) VALUES (
  '550e8400-e29b-41d4-a716-446655440000'::uuid,
  'nish2forsri@gmail.com',
  'Test User',
  now(),
  now()
) ON CONFLICT (id) DO NOTHING;

-- Clear existing leads for this user to avoid conflicts
DELETE FROM public.leads WHERE user_id = '550e8400-e29b-41d4-a716-446655440000'::uuid;

-- Generate 120 sample leads for the test user with Indian context
INSERT INTO public.leads (
  name,
  email,
  phone,
  company,
  status,
  source,
  notes,
  user_id,
  created_at
) VALUES
-- Tech Companies (30 leads)
('Rajesh Kumar', 'rajesh.kumar@tcs.com', '+91-9876543210', 'Tata Consultancy Services', 'new', 'website', 'Interested in digital transformation solutions', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '1 day'),
('Priya Sharma', 'priya.sharma@infosys.com', '+91-9876543211', 'Infosys Limited', 'contacted', 'referral', 'Referred by existing client from Bangalore', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '2 days'),
('Amit Patel', 'amit.patel@wipro.com', '+91-9876543212', 'Wipro Technologies', 'qualified', 'social_media', 'Ready to purchase cloud migration services', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '3 days'),
('Sneha Gupta', 'sneha.gupta@hcl.com', '+91-9876543213', 'HCL Technologies', 'new', 'advertisement', 'Saw our LinkedIn ad for AI solutions', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '4 days'),
('Vikram Singh', 'vikram.singh@techm.com', '+91-9876543214', 'Tech Mahindra', 'contacted', 'website', 'Downloaded whitepaper on automation', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '5 days'),
('Kavya Reddy', 'kavya.reddy@mindtree.com', '+91-9876543215', 'Mindtree Limited', 'qualified', 'referral', 'High-value prospect from Hyderabad', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '6 days'),
('Arjun Nair', 'arjun.nair@capgemini.com', '+91-9876543216', 'Capgemini India', 'lost', 'social_media', 'Went with competitor solution', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '7 days'),
('Deepika Joshi', 'deepika.joshi@accenture.com', '+91-9876543217', 'Accenture India', 'new', 'website', 'Requested demo for blockchain solutions', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '8 days'),
('Rohit Agarwal', 'rohit.agarwal@cognizant.com', '+91-9876543218', 'Cognizant Technology', 'contacted', 'advertisement', 'Responded to email campaign', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '9 days'),
('Ananya Iyer', 'ananya.iyer@ltimindtree.com', '+91-9876543219', 'LTIMindtree', 'qualified', 'referral', 'Budget approved for Q4', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '10 days'),
('Karthik Menon', 'karthik.menon@mphasis.com', '+91-9876543220', 'Mphasis Limited', 'new', 'social_media', 'Found us through Twitter', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '11 days'),
('Ritu Bansal', 'ritu.bansal@persistent.com', '+91-9876543221', 'Persistent Systems', 'contacted', 'website', 'Attended our webinar on DevOps', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '12 days'),
('Suresh Rao', 'suresh.rao@zensar.com', '+91-9876543222', 'Zensar Technologies', 'qualified', 'advertisement', 'Ready for proposal discussion', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '13 days'),
('Meera Krishnan', 'meera.krishnan@cyient.com', '+91-9876543223', 'Cyient Limited', 'lost', 'referral', 'Budget constraints this fiscal', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '14 days'),
('Nikhil Jain', 'nikhil.jain@sonata.com', '+91-9876543224', 'Sonata Software', 'new', 'website', 'Interested in API integration services', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '15 days'),
('Pooja Verma', 'pooja.verma@hexaware.com', '+91-9876543225', 'Hexaware Technologies', 'contacted', 'social_media', 'Engaged on LinkedIn posts', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '16 days'),
('Sanjay Mishra', 'sanjay.mishra@birlasoft.com', '+91-9876543226', 'Birlasoft Limited', 'qualified', 'advertisement', 'Decision maker identified', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '17 days'),
('Divya Pillai', 'divya.pillai@ltts.com', '+91-9876543227', 'L&T Technology Services', 'new', 'referral', 'Partner referral from Chennai', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '18 days'),
('Rahul Khanna', 'rahul.khanna@3i-infotech.com', '+91-9876543228', '3i Infotech Limited', 'contacted', 'website', 'Downloaded case study on fintech', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '19 days'),
('Shruti Desai', 'shruti.desai@rategain.com', '+91-9876543229', 'RateGain Technologies', 'qualified', 'social_media', 'Procurement process initiated', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '20 days'),
('Varun Chopra', 'varun.chopra@newgen.com', '+91-9876543230', 'Newgen Software', 'lost', 'advertisement', 'Timeline too aggressive', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '21 days'),
('Nisha Sinha', 'nisha.sinha@polaris.com', '+91-9876543231', 'Polaris Consulting', 'new', 'website', 'Pricing inquiry for banking solutions', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '22 days'),
('Gaurav Malhotra', 'gaurav.malhotra@mastek.com', '+91-9876543232', 'Mastek Limited', 'contacted', 'referral', 'Warm introduction from Mumbai', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '23 days'),
('Aditi Saxena', 'aditi.saxena@kpit.com', '+91-9876543233', 'KPIT Technologies', 'qualified', 'social_media', 'Budget confirmed for automotive solutions', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '24 days'),
('Manish Tiwari', 'manish.tiwari@cybage.com', '+91-9876543234', 'Cybage Software', 'new', 'advertisement', 'Google Ads click from Pune', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '25 days'),
('Swati Bhatt', 'swati.bhatt@mindteck.com', '+91-9876543235', 'Mindteck India', 'contacted', 'website', 'Free trial signup completed', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '26 days'),
('Arun Kumar', 'arun.kumar@saksoft.com', '+91-9876543236', 'Saksoft Limited', 'qualified', 'referral', 'Executive meeting scheduled', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '27 days'),
('Preeti Agrawal', 'preeti.agrawal@subex.com', '+91-9876543237', 'Subex Limited', 'lost', 'social_media', 'Internal solution preferred', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '28 days'),
('Vishal Gupta', 'vishal.gupta@ramco.com', '+91-9876543238', 'Ramco Systems', 'new', 'website', 'Contact form submission for ERP', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '29 days'),
('Riya Shah', 'riya.shah@nucleus.com', '+91-9876543239', 'Nucleus Software', 'contacted', 'advertisement', 'Email campaign response', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '30 days'),

-- Healthcare Companies (30 leads)
('Dr. Sunil Mehta', 'sunil.mehta@apollohospitals.com', '+91-9876543301', 'Apollo Hospitals', 'new', 'referral', 'Healthcare IT modernization project', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '31 days'),
('Dr. Kavita Rao', 'kavita.rao@fortishealthcare.com', '+91-9876543302', 'Fortis Healthcare', 'contacted', 'website', 'HIPAA compliance for Indian standards', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '32 days'),
('Dr. Rajesh Khanna', 'rajesh.khanna@maxhealthcare.com', '+91-9876543303', 'Max Healthcare', 'qualified', 'social_media', 'EMR integration requirements', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '33 days'),
('Dr. Sunita Sharma', 'sunita.sharma@manipalhospitals.com', '+91-9876543304', 'Manipal Hospitals', 'new', 'advertisement', 'Telemedicine platform for rural areas', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '34 days'),
('Dr. Anil Joshi', 'anil.joshi@narayanahealth.com', '+91-9876543305', 'Narayana Health', 'contacted', 'referral', 'Patient data analytics solution', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '35 days'),
('Dr. Meera Patel', 'meera.patel@caregroup.com', '+91-9876543306', 'Care Hospitals', 'qualified', 'website', 'Procurement approved for Q1', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '36 days'),
('Dr. Vikram Reddy', 'vikram.reddy@rainbowhospitals.com', '+91-9876543307', 'Rainbow Hospitals', 'lost', 'social_media', 'Vendor selection completed', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '37 days'),
('Dr. Priya Nair', 'priya.nair@columbiaasiahospitals.com', '+91-9876543308', 'Columbia Asia Hospitals', 'new', 'advertisement', 'Digital transformation initiative', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '38 days'),
('Dr. Ramesh Gupta', 'ramesh.gupta@medantahospitals.com', '+91-9876543309', 'Medanta Hospitals', 'contacted', 'referral', 'Interoperability solutions needed', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '39 days'),
('Dr. Anjali Singh', 'anjali.singh@jaslokhealth.com', '+91-9876543310', 'Jaslok Hospital', 'qualified', 'website', 'Implementation timeline finalized', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '40 days'),
('Dr. Vikram Agarwal', 'vikram.agarwal@apollohospitals.com', '+91-9876543311', 'Apollo Hospitals', 'new', 'referral', 'Radiology system upgrade', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '41 days'),
('Dr. Kavita Menon', 'kavita.menon@fortishealthcare.com', '+91-9876543312', 'Fortis Healthcare', 'contacted', 'website', 'Laboratory information system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '42 days'),
('Dr. Rajesh Iyer', 'rajesh.iyer@maxhealthcare.com', '+91-9876543313', 'Max Healthcare', 'qualified', 'social_media', 'Pharmacy management system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '43 days'),
('Dr. Sunita Bansal', 'sunita.bansal@manipalhospitals.com', '+91-9876543314', 'Manipal Hospitals', 'new', 'advertisement', 'Patient portal development', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '44 days'),
('Dr. Anil Verma', 'anil.verma@narayanahealth.com', '+91-9876543315', 'Narayana Health', 'contacted', 'referral', 'Clinical decision support', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '45 days'),
('Dr. Meera Desai', 'meera.desai@caregroup.com', '+91-9876543316', 'Care Hospitals', 'qualified', 'website', 'Revenue cycle management', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '46 days'),
('Dr. Vikram Jain', 'vikram.jain@rainbowhospitals.com', '+91-9876543317', 'Rainbow Hospitals', 'lost', 'social_media', 'Budget approval pending', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '47 days'),
('Dr. Priya Saxena', 'priya.saxena@columbiaasiahospitals.com', '+91-9876543318', 'Columbia Asia Hospitals', 'new', 'advertisement', 'Telehealth platform expansion', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '48 days'),
('Dr. Ramesh Pillai', 'ramesh.pillai@medantahospitals.com', '+91-9876543319', 'Medanta Hospitals', 'contacted', 'referral', 'Medical imaging solutions', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '49 days'),
('Dr. Anjali Chopra', 'anjali.chopra@jaslokhealth.com', '+91-9876543320', 'Jaslok Hospital', 'qualified', 'website', 'Electronic health records', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '50 days'),
('Dr. Vikram Malhotra', 'vikram.malhotra@apollohospitals.com', '+91-9876543321', 'Apollo Hospitals', 'new', 'referral', 'Surgical planning software', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '51 days'),
('Dr. Kavita Tiwari', 'kavita.tiwari@fortishealthcare.com', '+91-9876543322', 'Fortis Healthcare', 'contacted', 'website', 'Infection control system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '52 days'),
('Dr. Rajesh Bhatt', 'rajesh.bhatt@maxhealthcare.com', '+91-9876543323', 'Max Healthcare', 'qualified', 'social_media', 'Quality management system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '53 days'),
('Dr. Sunita Agrawal', 'sunita.agrawal@manipalhospitals.com', '+91-9876543324', 'Manipal Hospitals', 'new', 'advertisement', 'Clinical workflow optimization', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '54 days'),
('Dr. Anil Shah', 'anil.shah@narayanahealth.com', '+91-9876543325', 'Narayana Health', 'contacted', 'referral', 'Population health management', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '55 days'),
('Dr. Meera Sinha', 'meera.sinha@caregroup.com', '+91-9876543326', 'Care Hospitals', 'qualified', 'website', 'Care coordination platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '56 days'),
('Dr. Vikram Mishra', 'vikram.mishra@rainbowhospitals.com', '+91-9876543327', 'Rainbow Hospitals', 'lost', 'social_media', 'Regulatory compliance issues', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '57 days'),
('Dr. Priya Khanna', 'priya.khanna@columbiaasiahospitals.com', '+91-9876543328', 'Columbia Asia Hospitals', 'new', 'advertisement', 'Patient engagement tools', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '58 days'),
('Dr. Ramesh Rao', 'ramesh.rao@medantahospitals.com', '+91-9876543329', 'Medanta Hospitals', 'contacted', 'referral', 'Clinical research platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '59 days'),
('Dr. Anjali Reddy', 'anjali.reddy@jaslokhealth.com', '+91-9876543330', 'Jaslok Hospital', 'qualified', 'website', 'Medical device integration', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '60 days'),

-- Financial Services (30 leads)
('Rohit Agarwal', 'rohit.agarwal@hdfcbank.com', '+91-9876543401', 'HDFC Bank', 'new', 'website', 'Digital banking platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '61 days'),
('Sunita Sharma', 'sunita.sharma@icicibank.com', '+91-9876543402', 'ICICI Bank', 'contacted', 'referral', 'Regulatory compliance tools', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '62 days'),
('Vikram Patel', 'vikram.patel@sbi.com', '+91-9876543403', 'State Bank of India', 'qualified', 'social_media', 'Risk management solution', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '63 days'),
('Priya Gupta', 'priya.gupta@axisbank.com', '+91-9876543404', 'Axis Bank', 'new', 'advertisement', 'Fraud detection system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '64 days'),
('Rajesh Singh', 'rajesh.singh@kotakbank.com', '+91-9876543405', 'Kotak Mahindra Bank', 'contacted', 'website', 'Portfolio management tools', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '65 days'),
('Kavya Reddy', 'kavya.reddy@yesbank.com', '+91-9876543406', 'Yes Bank', 'qualified', 'referral', 'Core banking upgrade', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '66 days'),
('Amit Joshi', 'amit.joshi@indusindbank.com', '+91-9876543407', 'IndusInd Bank', 'lost', 'social_media', 'Competitor selected', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '67 days'),
('Sneha Nair', 'sneha.nair@federalbank.com', '+91-9876543408', 'Federal Bank', 'new', 'advertisement', 'Credit scoring models', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '68 days'),
('Arjun Menon', 'arjun.menon@rbl.com', '+91-9876543409', 'RBL Bank', 'contacted', 'website', 'Algorithmic trading platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '69 days'),
('Deepika Iyer', 'deepika.iyer@bandhanbank.com', '+91-9876543410', 'Bandhan Bank', 'qualified', 'referral', 'Mobile banking enhancement', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '70 days'),
('Karthik Bansal', 'karthik.bansal@bajajfinserv.com', '+91-9876543411', 'Bajaj Finserv', 'new', 'social_media', 'Blockchain integration', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '71 days'),
('Ritu Verma', 'ritu.verma@mahindrafinance.com', '+91-9876543412', 'Mahindra Finance', 'contacted', 'advertisement', 'Regulatory reporting', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '72 days'),
('Suresh Desai', 'suresh.desai@hdfclife.com', '+91-9876543413', 'HDFC Life', 'qualified', 'website', 'Loan origination system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '73 days'),
('Meera Saxena', 'meera.saxena@iciciprulife.com', '+91-9876543414', 'ICICI Prudential', 'lost', 'referral', 'Budget constraints', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '74 days'),
('Nikhil Chopra', 'nikhil.chopra@sbilife.com', '+91-9876543415', 'SBI Life', 'new', 'website', 'Customer onboarding', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '75 days'),
('Pooja Malhotra', 'pooja.malhotra@lichousing.com', '+91-9876543416', 'LIC Housing Finance', 'contacted', 'referral', 'Anti-money laundering', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '76 days'),
('Sanjay Tiwari', 'sanjay.tiwari@pnbhousing.com', '+91-9876543417', 'PNB Housing Finance', 'qualified', 'social_media', 'Decision engine upgrade', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '77 days'),
('Divya Bhatt', 'divya.bhatt@canfinhomes.com', '+91-9876543418', 'Can Fin Homes', 'new', 'advertisement', 'Wealth management platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '78 days'),
('Rahul Agrawal', 'rahul.agrawal@indiabulls.com', '+91-9876543419', 'Indiabulls Housing Finance', 'contacted', 'social_media', 'Open banking APIs', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '79 days'),
('Shruti Sinha', 'shruti.sinha@dewan.com', '+91-9876543420', 'Dewan Housing Finance', 'qualified', 'advertisement', 'Payment processing upgrade', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '80 days'),
('Varun Khanna', 'varun.khanna@repco.com', '+91-9876543421', 'Repco Home Finance', 'lost', 'website', 'Internal development chosen', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '81 days'),
('Nisha Pillai', 'nisha.pillai@gruhfinance.com', '+91-9876543422', 'Gruh Finance', 'new', 'referral', 'Credit risk analytics', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '82 days'),
('Gaurav Rao', 'gaurav.rao@aadhaarhousing.com', '+91-9876543423', 'Aadhaar Housing Finance', 'contacted', 'social_media', 'Robo-advisor platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '83 days'),
('Aditi Mishra', 'aditi.mishra@motilal.com', '+91-9876543424', 'Motilal Oswal', 'qualified', 'advertisement', 'Digital transformation', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '84 days'),
('Manish Kumar', 'manish.kumar@edelweiss.com', '+91-9876543425', 'Edelweiss Financial', 'new', 'website', 'Treasury management', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '85 days'),
('Swati Jain', 'swati.jain@angelbroking.com', '+91-9876543426', 'Angel Broking', 'contacted', 'referral', 'Underwriting automation', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '86 days'),
('Arun Sharma', 'arun.sharma@zerodha.com', '+91-9876543427', 'Zerodha', 'qualified', 'social_media', 'ESG investment tools', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '87 days'),
('Preeti Patel', 'preeti.patel@upstox.com', '+91-9876543428', 'Upstox', 'lost', 'advertisement', 'Regulatory changes', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '88 days'),
('Vishal Reddy', 'vishal.reddy@5paisa.com', '+91-9876543429', '5paisa', 'new', 'website', 'Cryptocurrency services', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '89 days'),
('Riya Gupta', 'riya.gupta@groww.com', '+91-9876543430', 'Groww', 'contacted', 'referral', 'Stress testing tools', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '90 days'),

-- Retail & E-commerce (30 leads)
('Rajesh Agarwal', 'rajesh.agarwal@reliance.com', '+91-9876543501', 'Reliance Retail', 'new', 'social_media', 'E-commerce platform upgrade', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '91 days'),
('Priya Sharma', 'priya.sharma@bigbazaar.com', '+91-9876543502', 'Big Bazaar', 'contacted', 'advertisement', 'Inventory management system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '92 days'),
('Amit Patel', 'amit.patel@flipkart.com', '+91-9876543503', 'Flipkart', 'qualified', 'website', 'Omnichannel solution', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '93 days'),
('Sneha Gupta', 'sneha.gupta@amazon.in', '+91-9876543504', 'Amazon India', 'new', 'referral', 'POS system modernization', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '94 days'),
('Vikram Singh', 'vikram.singh@myntra.com', '+91-9876543505', 'Myntra', 'contacted', 'social_media', 'Customer analytics platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '95 days'),
('Kavya Reddy', 'kavya.reddy@snapdeal.com', '+91-9876543506', 'Snapdeal', 'qualified', 'advertisement', 'Supply chain optimization', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '96 days'),
('Arjun Nair', 'arjun.nair@shopclues.com', '+91-9876543507', 'ShopClues', 'lost', 'website', 'Feature requirements mismatch', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '97 days'),
('Deepika Joshi', 'deepika.joshi@paytmmall.com', '+91-9876543508', 'Paytm Mall', 'new', 'referral', 'Mobile commerce solution', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '98 days'),
('Rohit Agarwal', 'rohit.agarwal@tatacliq.com', '+91-9876543509', 'Tata CLiQ', 'contacted', 'social_media', 'Personalization engine', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '99 days'),
('Ananya Iyer', 'ananya.iyer@ajio.com', '+91-9876543510', 'AJIO', 'qualified', 'advertisement', 'Loyalty program platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '100 days'),
('Karthik Menon', 'karthik.menon@nykaa.com', '+91-9876543511', 'Nykaa', 'new', 'website', 'Marketplace integration', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '101 days'),
('Ritu Bansal', 'ritu.bansal@limeroad.com', '+91-9876543512', 'LimeRoad', 'contacted', 'referral', 'Payment gateway upgrade', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '102 days'),
('Suresh Rao', 'suresh.rao@jabong.com', '+91-9876543513', 'Jabong', 'qualified', 'social_media', 'Fraud prevention system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '103 days'),
('Meera Krishnan', 'meera.krishnan@koovs.com', '+91-9876543514', 'Koovs', 'lost', 'advertisement', 'Budget reallocation', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '104 days'),
('Nikhil Jain', 'nikhil.jain@voonik.com', '+91-9876543515', 'Voonik', 'new', 'website', 'B2B e-commerce platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '105 days'),
('Pooja Verma', 'pooja.verma@craftsvilla.com', '+91-9876543516', 'Craftsvilla', 'contacted', 'referral', 'Warehouse management', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '106 days'),
('Sanjay Mishra', 'sanjay.mishra@shoppers.com', '+91-9876543517', 'Shoppers Stop', 'qualified', 'social_media', 'Order management system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '107 days'),
('Divya Pillai', 'divya.pillai@lifestyle.com', '+91-9876543518', 'Lifestyle', 'new', 'advertisement', 'Customer service platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '108 days'),
('Rahul Khanna', 'rahul.khanna@pantaloons.com', '+91-9876543519', 'Pantaloons', 'contacted', 'website', 'Social commerce integration', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '109 days'),
('Shruti Desai', 'shruti.desai@westside.com', '+91-9876543520', 'Westside', 'qualified', 'referral', 'Subscription commerce', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '110 days'),
('Varun Chopra', 'varun.chopra@maxfashion.com', '+91-9876543521', 'Max Fashion', 'lost', 'social_media', 'Timeline constraints', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '111 days'),
('Nisha Sinha', 'nisha.sinha@brandsfactory.com', '+91-9876543522', 'Brands Factory', 'new', 'advertisement', 'Multi-store management', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '112 days'),
('Gaurav Malhotra', 'gaurav.malhotra@trendin.com', '+91-9876543523', 'TrendIn', 'contacted', 'website', 'Headless commerce', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '113 days'),
('Aditi Saxena', 'aditi.saxena@fashionara.com', '+91-9876543524', 'Fashionara', 'qualified', 'referral', 'AR/VR shopping experience', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '114 days'),
('Manish Tiwari', 'manish.tiwari@yepme.com', '+91-9876543525', 'Yepme', 'new', 'social_media', 'Voice commerce platform', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '115 days'),
('Swati Bhatt', 'swati.bhatt@zivame.com', '+91-9876543526', 'Zivame', 'contacted', 'advertisement', 'Dynamic pricing engine', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '116 days'),
('Arun Kumar', 'arun.kumar@clovia.com', '+91-9876543527', 'Clovia', 'qualified', 'website', 'Recommendation system', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '117 days'),
('Preeti Agrawal', 'preeti.agrawal@prettysecrets.com', '+91-9876543528', 'PrettySecrets', 'lost', 'referral', 'Vendor consolidation', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '118 days'),
('Vishal Gupta', 'vishal.gupta@bewakoof.com', '+91-9876543529', 'Bewakoof', 'new', 'social_media', 'Sustainability tracking', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '119 days'),
('Riya Shah', 'riya.shah@thesouledstore.com', '+91-9876543530', 'The Souled Store', 'contacted', 'advertisement', 'Customer journey analytics', '550e8400-e29b-41d4-a716-446655440000'::uuid, now() - interval '120 days');

-- Update the updated_at timestamps to match created_at for consistency
UPDATE public.leads SET updated_at = created_at WHERE user_id = '550e8400-e29b-41d4-a716-446655440000'::uuid;
