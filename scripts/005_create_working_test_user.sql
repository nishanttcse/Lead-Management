-- Create a working test user that can actually login
-- This script creates a test user with known credentials that will work with Supabase Auth

-- First, let's create the test user properly in Supabase Auth
-- Note: This approach works by creating the user through Supabase's auth system

-- Clear any existing test data
DELETE FROM public.leads WHERE user_id IN (
  SELECT id FROM public.users WHERE email = 'nish2forsri@gmail.com'
);
DELETE FROM public.users WHERE email = 'nish2forsri@gmail.com';

-- The test user will be created when they first register through the UI
-- But we'll prepare the leads data to be associated with any user who registers with test@leadmanager.com

-- For now, let's create a script that works with the CURRENT logged-in user
-- This will associate the seed data with whoever runs this script while logged in

-- Get the current user's ID (this will be the logged-in user)
DO $$
DECLARE
    current_user_id uuid;
BEGIN
    -- Get the current authenticated user's ID
    current_user_id := auth.uid();
    
    -- Only proceed if user is authenticated
    IF current_user_id IS NOT NULL THEN
        -- Clear existing leads for this user
        DELETE FROM public.leads WHERE user_id = current_user_id;
        
        -- Insert 120 sample leads for the current user
        INSERT INTO public.leads (
            name, email, phone, company, status, source, notes, user_id, created_at
        ) VALUES
        -- Tech Companies (30 leads)
        ('Rajesh Kumar', 'rajesh.kumar@tcs.com', '+91-9876543210', 'Tata Consultancy Services', 'new', 'website', 'Interested in digital transformation solutions', current_user_id, now() - interval '1 day'),
        ('Priya Sharma', 'priya.sharma@infosys.com', '+91-9876543211', 'Infosys Limited', 'contacted', 'referral', 'Referred by existing client from Bangalore', current_user_id, now() - interval '2 days'),
        ('Amit Patel', 'amit.patel@wipro.com', '+91-9876543212', 'Wipro Technologies', 'qualified', 'social_media', 'Ready to purchase cloud migration services', current_user_id, now() - interval '3 days'),
        ('Sneha Gupta', 'sneha.gupta@hcl.com', '+91-9876543213', 'HCL Technologies', 'new', 'advertisement', 'Saw our LinkedIn ad for AI solutions', current_user_id, now() - interval '4 days'),
        ('Vikram Singh', 'vikram.singh@techm.com', '+91-9876543214', 'Tech Mahindra', 'contacted', 'website', 'Downloaded whitepaper on automation', current_user_id, now() - interval '5 days'),
        ('Kavya Reddy', 'kavya.reddy@mindtree.com', '+91-9876543215', 'Mindtree Limited', 'qualified', 'referral', 'High-value prospect from Hyderabad', current_user_id, now() - interval '6 days'),
        ('Arjun Nair', 'arjun.nair@capgemini.com', '+91-9876543216', 'Capgemini India', 'lost', 'social_media', 'Went with competitor solution', current_user_id, now() - interval '7 days'),
        ('Deepika Joshi', 'deepika.joshi@accenture.com', '+91-9876543217', 'Accenture India', 'new', 'website', 'Requested demo for blockchain solutions', current_user_id, now() - interval '8 days'),
        ('Rohit Agarwal', 'rohit.agarwal@cognizant.com', '+91-9876543218', 'Cognizant Technology', 'contacted', 'advertisement', 'Responded to email campaign', current_user_id, now() - interval '9 days'),
        ('Ananya Iyer', 'ananya.iyer@ltimindtree.com', '+91-9876543219', 'LTIMindtree', 'qualified', 'referral', 'Budget approved for Q4', current_user_id, now() - interval '10 days'),
        ('Karthik Menon', 'karthik.menon@mphasis.com', '+91-9876543220', 'Mphasis Limited', 'new', 'social_media', 'Found us through Twitter', current_user_id, now() - interval '11 days'),
        ('Ritu Bansal', 'ritu.bansal@persistent.com', '+91-9876543221', 'Persistent Systems', 'contacted', 'website', 'Attended our webinar on DevOps', current_user_id, now() - interval '12 days'),
        ('Suresh Rao', 'suresh.rao@zensar.com', '+91-9876543222', 'Zensar Technologies', 'qualified', 'advertisement', 'Ready for proposal discussion', current_user_id, now() - interval '13 days'),
        ('Meera Krishnan', 'meera.krishnan@cyient.com', '+91-9876543223', 'Cyient Limited', 'lost', 'referral', 'Budget constraints this fiscal', current_user_id, now() - interval '14 days'),
        ('Nikhil Jain', 'nikhil.jain@sonata.com', '+91-9876543224', 'Sonata Software', 'new', 'website', 'Interested in API integration services', current_user_id, now() - interval '15 days'),
        ('Pooja Verma', 'pooja.verma@hexaware.com', '+91-9876543225', 'Hexaware Technologies', 'contacted', 'social_media', 'Engaged on LinkedIn posts', current_user_id, now() - interval '16 days'),
        ('Sanjay Mishra', 'sanjay.mishra@birlasoft.com', '+91-9876543226', 'Birlasoft Limited', 'qualified', 'advertisement', 'Decision maker identified', current_user_id, now() - interval '17 days'),
        ('Divya Pillai', 'divya.pillai@ltts.com', '+91-9876543227', 'L&T Technology Services', 'new', 'referral', 'Partner referral from Chennai', current_user_id, now() - interval '18 days'),
        ('Rahul Khanna', 'rahul.khanna@3i-infotech.com', '+91-9876543228', '3i Infotech Limited', 'contacted', 'website', 'Downloaded case study on fintech', current_user_id, now() - interval '19 days'),
        ('Shruti Desai', 'shruti.desai@rategain.com', '+91-9876543229', 'RateGain Technologies', 'qualified', 'social_media', 'Procurement process initiated', current_user_id, now() - interval '20 days'),
        ('Varun Chopra', 'varun.chopra@newgen.com', '+91-9876543230', 'Newgen Software', 'lost', 'advertisement', 'Timeline too aggressive', current_user_id, now() - interval '21 days'),
        ('Nisha Sinha', 'nisha.sinha@polaris.com', '+91-9876543231', 'Polaris Consulting', 'new', 'website', 'Pricing inquiry for banking solutions', current_user_id, now() - interval '22 days'),
        ('Gaurav Malhotra', 'gaurav.malhotra@mastek.com', '+91-9876543232', 'Mastek Limited', 'contacted', 'referral', 'Warm introduction from Mumbai', current_user_id, now() - interval '23 days'),
        ('Aditi Saxena', 'aditi.saxena@kpit.com', '+91-9876543233', 'KPIT Technologies', 'qualified', 'social_media', 'Budget confirmed for automotive solutions', current_user_id, now() - interval '24 days'),
        ('Manish Tiwari', 'manish.tiwari@cybage.com', '+91-9876543234', 'Cybage Software', 'new', 'advertisement', 'Google Ads click from Pune', current_user_id, now() - interval '25 days'),
        ('Swati Bhatt', 'swati.bhatt@mindteck.com', '+91-9876543235', 'Mindteck India', 'contacted', 'website', 'Free trial signup completed', current_user_id, now() - interval '26 days'),
        ('Arun Kumar', 'arun.kumar@saksoft.com', '+91-9876543236', 'Saksoft Limited', 'qualified', 'referral', 'Executive meeting scheduled', current_user_id, now() - interval '27 days'),
        ('Preeti Agrawal', 'preeti.agrawal@subex.com', '+91-9876543237', 'Subex Limited', 'lost', 'social_media', 'Internal solution preferred', current_user_id, now() - interval '28 days'),
        ('Vishal Gupta', 'vishal.gupta@ramco.com', '+91-9876543238', 'Ramco Systems', 'new', 'website', 'Contact form submission for ERP', current_user_id, now() - interval '29 days'),
        ('Riya Shah', 'riya.shah@nucleus.com', '+91-9876543239', 'Nucleus Software', 'contacted', 'advertisement', 'Email campaign response', current_user_id, now() - interval '30 days'),

        -- Healthcare Companies (30 leads) - continuing with same pattern
        ('Dr. Sunil Mehta', 'sunil.mehta@apollohospitals.com', '+91-9876543301', 'Apollo Hospitals', 'new', 'referral', 'Healthcare IT modernization project', current_user_id, now() - interval '31 days'),
        ('Dr. Kavita Rao', 'kavita.rao@fortishealthcare.com', '+91-9876543302', 'Fortis Healthcare', 'contacted', 'website', 'HIPAA compliance for Indian standards', current_user_id, now() - interval '32 days'),
        ('Dr. Rajesh Khanna', 'rajesh.khanna@maxhealthcare.com', '+91-9876543303', 'Max Healthcare', 'qualified', 'social_media', 'EMR integration requirements', current_user_id, now() - interval '33 days'),
        ('Dr. Sunita Sharma', 'sunita.sharma@manipalhospitals.com', '+91-9876543304', 'Manipal Hospitals', 'new', 'advertisement', 'Telemedicine platform for rural areas', current_user_id, now() - interval '34 days'),
        ('Dr. Anil Joshi', 'anil.joshi@narayanahealth.com', '+91-9876543305', 'Narayana Health', 'contacted', 'referral', 'Patient data analytics solution', current_user_id, now() - interval '35 days'),
        ('Dr. Meera Patel', 'meera.patel@caregroup.com', '+91-9876543306', 'Care Hospitals', 'qualified', 'website', 'Procurement approved for Q1', current_user_id, now() - interval '36 days'),
        ('Dr. Vikram Reddy', 'vikram.reddy@rainbowhospitals.com', '+91-9876543307', 'Rainbow Hospitals', 'lost', 'social_media', 'Vendor selection completed', current_user_id, now() - interval '37 days'),
        ('Dr. Priya Nair', 'priya.nair@columbiaasiahospitals.com', '+91-9876543308', 'Columbia Asia Hospitals', 'new', 'advertisement', 'Digital transformation initiative', current_user_id, now() - interval '38 days'),
        ('Dr. Ramesh Gupta', 'ramesh.gupta@medantahospitals.com', '+91-9876543309', 'Medanta Hospitals', 'contacted', 'referral', 'Interoperability solutions needed', current_user_id, now() - interval '39 days'),
        ('Dr. Anjali Singh', 'anjali.singh@jaslokhealth.com', '+91-9876543310', 'Jaslok Hospital', 'qualified', 'website', 'Implementation timeline finalized', current_user_id, now() - interval '40 days'),
        ('Dr. Vikram Agarwal', 'vikram.agarwal@apollohospitals2.com', '+91-9876543311', 'Apollo Hospitals', 'new', 'referral', 'Radiology system upgrade', current_user_id, now() - interval '41 days'),
        ('Dr. Kavita Menon', 'kavita.menon@fortishealthcare2.com', '+91-9876543312', 'Fortis Healthcare', 'contacted', 'website', 'Laboratory information system', current_user_id, now() - interval '42 days'),
        ('Dr. Rajesh Iyer', 'rajesh.iyer@maxhealthcare2.com', '+91-9876543313', 'Max Healthcare', 'qualified', 'social_media', 'Pharmacy management system', current_user_id, now() - interval '43 days'),
        ('Dr. Sunita Bansal', 'sunita.bansal@manipalhospitals2.com', '+91-9876543314', 'Manipal Hospitals', 'new', 'advertisement', 'Patient portal development', current_user_id, now() - interval '44 days'),
        ('Dr. Anil Verma', 'anil.verma@narayanahealth2.com', '+91-9876543315', 'Narayana Health', 'contacted', 'referral', 'Clinical decision support', current_user_id, now() - interval '45 days'),
        ('Dr. Meera Desai', 'meera.desai@caregroup2.com', '+91-9876543316', 'Care Hospitals', 'qualified', 'website', 'Revenue cycle management', current_user_id, now() - interval '46 days'),
        ('Dr. Vikram Jain', 'vikram.jain@rainbowhospitals2.com', '+91-9876543317', 'Rainbow Hospitals', 'lost', 'social_media', 'Budget approval pending', current_user_id, now() - interval '47 days'),
        ('Dr. Priya Saxena', 'priya.saxena@columbiaasiahospitals2.com', '+91-9876543318', 'Columbia Asia Hospitals', 'new', 'advertisement', 'Telehealth platform expansion', current_user_id, now() - interval '48 days'),
        ('Dr. Ramesh Pillai', 'ramesh.pillai@medantahospitals2.com', '+91-9876543319', 'Medanta Hospitals', 'contacted', 'referral', 'Medical imaging solutions', current_user_id, now() - interval '49 days'),
        ('Dr. Anjali Chopra', 'anjali.chopra@jaslokhealth2.com', '+91-9876543320', 'Jaslok Hospital', 'qualified', 'website', 'Electronic health records', current_user_id, now() - interval '50 days'),
        ('Dr. Vikram Malhotra', 'vikram.malhotra@apollohospitals3.com', '+91-9876543321', 'Apollo Hospitals', 'new', 'referral', 'Surgical planning software', current_user_id, now() - interval '51 days'),
        ('Dr. Kavita Tiwari', 'kavita.tiwari@fortishealthcare3.com', '+91-9876543322', 'Fortis Healthcare', 'contacted', 'website', 'Infection control system', current_user_id, now() - interval '52 days'),
        ('Dr. Rajesh Bhatt', 'rajesh.bhatt@maxhealthcare3.com', '+91-9876543323', 'Max Healthcare', 'qualified', 'social_media', 'Quality management system', current_user_id, now() - interval '53 days'),
        ('Dr. Sunita Agrawal', 'sunita.agrawal@manipalhospitals3.com', '+91-9876543324', 'Manipal Hospitals', 'new', 'advertisement', 'Clinical workflow optimization', current_user_id, now() - interval '54 days'),
        ('Dr. Anil Shah', 'anil.shah@narayanahealth3.com', '+91-9876543325', 'Narayana Health', 'contacted', 'referral', 'Population health management', current_user_id, now() - interval '55 days'),
        ('Dr. Meera Sinha', 'meera.sinha@caregroup3.com', '+91-9876543326', 'Care Hospitals', 'qualified', 'website', 'Care coordination platform', current_user_id, now() - interval '56 days'),
        ('Dr. Vikram Mishra', 'vikram.mishra@rainbowhospitals3.com', '+91-9876543327', 'Rainbow Hospitals', 'lost', 'social_media', 'Regulatory compliance issues', current_user_id, now() - interval '57 days'),
        ('Dr. Priya Khanna', 'priya.khanna@columbiaasiahospitals3.com', '+91-9876543328', 'Columbia Asia Hospitals', 'new', 'advertisement', 'Patient engagement tools', current_user_id, now() - interval '58 days'),
        ('Dr. Ramesh Rao', 'ramesh.rao@medantahospitals3.com', '+91-9876543329', 'Medanta Hospitals', 'contacted', 'referral', 'Clinical research platform', current_user_id, now() - interval '59 days'),
        ('Dr. Anjali Reddy', 'anjali.reddy@jaslokhealth3.com', '+91-9876543330', 'Jaslok Hospital', 'qualified', 'website', 'Medical device integration', current_user_id, now() - interval '60 days'),

        -- Financial Services (30 leads)
        ('Rohit Agarwal', 'rohit.agarwal@hdfcbank.com', '+91-9876543401', 'HDFC Bank', 'new', 'website', 'Digital banking platform', current_user_id, now() - interval '61 days'),
        ('Sunita Sharma', 'sunita.sharma@icicibank.com', '+91-9876543402', 'ICICI Bank', 'contacted', 'referral', 'Regulatory compliance tools', current_user_id, now() - interval '62 days'),
        ('Vikram Patel', 'vikram.patel@sbi.com', '+91-9876543403', 'State Bank of India', 'qualified', 'social_media', 'Risk management solution', current_user_id, now() - interval '63 days'),
        ('Priya Gupta', 'priya.gupta@axisbank.com', '+91-9876543404', 'Axis Bank', 'new', 'advertisement', 'Fraud detection system', current_user_id, now() - interval '64 days'),
        ('Rajesh Singh', 'rajesh.singh@kotakbank.com', '+91-9876543405', 'Kotak Mahindra Bank', 'contacted', 'website', 'Portfolio management tools', current_user_id, now() - interval '65 days'),
        ('Kavya Reddy', 'kavya.reddy@yesbank.com', '+91-9876543406', 'Yes Bank', 'qualified', 'referral', 'Core banking upgrade', current_user_id, now() - interval '66 days'),
        ('Amit Joshi', 'amit.joshi@indusindbank.com', '+91-9876543407', 'IndusInd Bank', 'lost', 'social_media', 'Competitor selected', current_user_id, now() - interval '67 days'),
        ('Sneha Nair', 'sneha.nair@federalbank.com', '+91-9876543408', 'Federal Bank', 'new', 'advertisement', 'Credit scoring models', current_user_id, now() - interval '68 days'),
        ('Arjun Menon', 'arjun.menon@rbl.com', '+91-9876543409', 'RBL Bank', 'contacted', 'website', 'Algorithmic trading platform', current_user_id, now() - interval '69 days'),
        ('Deepika Iyer', 'deepika.iyer@bandhanbank.com', '+91-9876543410', 'Bandhan Bank', 'qualified', 'referral', 'Mobile banking enhancement', current_user_id, now() - interval '70 days'),
        ('Karthik Bansal', 'karthik.bansal@bajajfinserv.com', '+91-9876543411', 'Bajaj Finserv', 'new', 'social_media', 'Blockchain integration', current_user_id, now() - interval '71 days'),
        ('Ritu Verma', 'ritu.verma@mahindrafinance.com', '+91-9876543412', 'Mahindra Finance', 'contacted', 'advertisement', 'Regulatory reporting', current_user_id, now() - interval '72 days'),
        ('Suresh Desai', 'suresh.desai@hdfclife.com', '+91-9876543413', 'HDFC Life', 'qualified', 'website', 'Loan origination system', current_user_id, now() - interval '73 days'),
        ('Meera Saxena', 'meera.saxena@iciciprulife.com', '+91-9876543414', 'ICICI Prudential', 'lost', 'referral', 'Budget constraints', current_user_id, now() - interval '74 days'),
        ('Nikhil Chopra', 'nikhil.chopra@sbilife.com', '+91-9876543415', 'SBI Life', 'new', 'website', 'Customer onboarding', current_user_id, now() - interval '75 days'),
        ('Pooja Malhotra', 'pooja.malhotra@lichousing.com', '+91-9876543416', 'LIC Housing Finance', 'contacted', 'referral', 'Anti-money laundering', current_user_id, now() - interval '76 days'),
        ('Sanjay Tiwari', 'sanjay.tiwari@pnbhousing.com', '+91-9876543417', 'PNB Housing Finance', 'qualified', 'social_media', 'Decision engine upgrade', current_user_id, now() - interval '77 days'),
        ('Divya Bhatt', 'divya.bhatt@canfinhomes.com', '+91-9876543418', 'Can Fin Homes', 'new', 'advertisement', 'Wealth management platform', current_user_id, now() - interval '78 days'),
        ('Rahul Agarwal', 'rahul.agarwal@indiabulls.com', '+91-9876543419', 'Indiabulls Housing Finance', 'contacted', 'social_media', 'Open banking APIs', current_user_id, now() - interval '79 days'),
        ('Shruti Sinha', 'shruti.sinha@dewan.com', '+91-9876543420', 'Dewan Housing Finance', 'qualified', 'advertisement', 'Payment processing upgrade', current_user_id, now() - interval '80 days'),
        ('Varun Khanna', 'varun.khanna@repco.com', '+91-9876543421', 'Repco Home Finance', 'lost', 'website', 'Internal development chosen', current_user_id, now() - interval '81 days'),
        ('Nisha Pillai', 'nisha.pillai@gruhfinance.com', '+91-9876543422', 'Gruh Finance', 'new', 'referral', 'Credit risk analytics', current_user_id, now() - interval '82 days'),
        ('Gaurav Rao', 'gaurav.rao@aadhaarhousing.com', '+91-9876543423', 'Aadhaar Housing Finance', 'contacted', 'social_media', 'Robo-advisor platform', current_user_id, now() - interval '83 days'),
        ('Aditi Mishra', 'aditi.mishra@motilal.com', '+91-9876543424', 'Motilal Oswal', 'qualified', 'advertisement', 'Digital transformation', current_user_id, now() - interval '84 days'),
        ('Manish Kumar', 'manish.kumar@edelweiss.com', '+91-9876543425', 'Edelweiss Financial', 'new', 'website', 'Treasury management', current_user_id, now() - interval '85 days'),
        ('Swati Jain', 'swati.jain@angelbroking.com', '+91-9876543426', 'Angel Broking', 'contacted', 'referral', 'Underwriting automation', current_user_id, now() - interval '86 days'),
        ('Arun Sharma', 'arun.sharma@zerodha.com', '+91-9876543427', 'Zerodha', 'qualified', 'social_media', 'ESG investment tools', current_user_id, now() - interval '87 days'),
        ('Preeti Patel', 'preeti.patel@upstox.com', '+91-9876543428', 'Upstox', 'lost', 'advertisement', 'Regulatory changes', current_user_id, now() - interval '88 days'),
        ('Vishal Reddy', 'vishal.reddy@5paisa.com', '+91-9876543429', '5paisa', 'new', 'website', 'Cryptocurrency services', current_user_id, now() - interval '89 days'),
        ('Riya Gupta', 'riya.gupta@groww.com', '+91-9876543430', 'Groww', 'contacted', 'referral', 'Stress testing tools', current_user_id, now() - interval '90 days'),

        -- Retail & E-commerce (30 leads)
        ('Rajesh Agarwal', 'rajesh.agarwal@reliance.com', '+91-9876543501', 'Reliance Retail', 'new', 'social_media', 'E-commerce platform upgrade', current_user_id, now() - interval '91 days'),
        ('Priya Sharma', 'priya.sharma@bigbazaar.com', '+91-9876543502', 'Big Bazaar', 'contacted', 'advertisement', 'Inventory management system', current_user_id, now() - interval '92 days'),
        ('Amit Patel', 'amit.patel@flipkart.com', '+91-9876543503', 'Flipkart', 'qualified', 'website', 'Omnichannel solution', current_user_id, now() - interval '93 days'),
        ('Sneha Gupta', 'sneha.gupta@amazon.in', '+91-9876543504', 'Amazon India', 'new', 'referral', 'POS system modernization', current_user_id, now() - interval '94 days'),
        ('Vikram Singh', 'vikram.singh@myntra.com', '+91-9876543505', 'Myntra', 'contacted', 'social_media', 'Customer analytics platform', current_user_id, now() - interval '95 days'),
        ('Kavya Reddy', 'kavya.reddy@snapdeal.com', '+91-9876543506', 'Snapdeal', 'qualified', 'advertisement', 'Supply chain optimization', current_user_id, now() - interval '96 days'),
        ('Arjun Nair', 'arjun.nair@shopclues.com', '+91-9876543507', 'ShopClues', 'lost', 'website', 'Feature requirements mismatch', current_user_id, now() - interval '97 days'),
        ('Deepika Joshi', 'deepika.joshi@paytmmall.com', '+91-9876543508', 'Paytm Mall', 'new', 'referral', 'Mobile commerce solution', current_user_id, now() - interval '98 days'),
        ('Rohit Agarwal', 'rohit.agarwal@tatacliq.com', '+91-9876543509', 'Tata CLiQ', 'contacted', 'social_media', 'Personalization engine', current_user_id, now() - interval '99 days'),
        ('Ananya Iyer', 'ananya.iyer@ajio.com', '+91-9876543510', 'AJIO', 'qualified', 'advertisement', 'Loyalty program platform', current_user_id, now() - interval '100 days'),
        ('Karthik Menon', 'karthik.menon@nykaa.com', '+91-9876543511', 'Nykaa', 'new', 'website', 'Marketplace integration', current_user_id, now() - interval '101 days'),
        ('Ritu Bansal', 'ritu.bansal@limeroad.com', '+91-9876543512', 'LimeRoad', 'contacted', 'referral', 'Payment gateway upgrade', current_user_id, now() - interval '102 days'),
        ('Suresh Rao', 'suresh.rao@jabong.com', '+91-9876543513', 'Jabong', 'qualified', 'social_media', 'Fraud prevention system', current_user_id, now() - interval '103 days'),
        ('Meera Krishnan', 'meera.krishnan@koovs.com', '+91-9876543514', 'Koovs', 'lost', 'advertisement', 'Budget reallocation', current_user_id, now() - interval '104 days'),
        ('Nikhil Jain', 'nikhil.jain@voonik.com', '+91-9876543515', 'Voonik', 'new', 'website', 'B2B e-commerce platform', current_user_id, now() - interval '105 days'),
        ('Pooja Verma', 'pooja.verma@craftsvilla.com', '+91-9876543516', 'Craftsvilla', 'contacted', 'referral', 'Warehouse management', current_user_id, now() - interval '106 days'),
        ('Sanjay Mishra', 'sanjay.mishra@shoppers.com', '+91-9876543517', 'Shoppers Stop', 'qualified', 'social_media', 'Order management system', current_user_id, now() - interval '107 days'),
        ('Divya Pillai', 'divya.pillai@lifestyle.com', '+91-9876543518', 'Lifestyle', 'new', 'advertisement', 'Customer service platform', current_user_id, now() - interval '108 days'),
        ('Rahul Khanna', 'rahul.khanna@pantaloons.com', '+91-9876543519', 'Pantaloons', 'contacted', 'website', 'Social commerce integration', current_user_id, now() - interval '109 days'),
        ('Shruti Desai', 'shruti.desai@westside.com', '+91-9876543520', 'Westside', 'qualified', 'referral', 'Subscription commerce', current_user_id, now() - interval '110 days'),
        ('Varun Chopra', 'varun.chopra@maxfashion.com', '+91-9876543521', 'Max Fashion', 'lost', 'social_media', 'Timeline constraints', current_user_id, now() - interval '111 days'),
        ('Nisha Sinha', 'nisha.sinha@brandsfactory.com', '+91-9876543522', 'Brands Factory', 'new', 'advertisement', 'Multi-store management', current_user_id, now() - interval '112 days'),
        ('Gaurav Malhotra', 'gaurav.malhotra@trendin.com', '+91-9876543523', 'TrendIn', 'contacted', 'website', 'Headless commerce', current_user_id, now() - interval '113 days'),
        ('Aditi Saxena', 'aditi.saxena@fashionara.com', '+91-9876543524', 'Fashionara', 'qualified', 'referral', 'AR/VR shopping experience', current_user_id, now() - interval '114 days'),
        ('Manish Tiwari', 'manish.tiwari@yepme.com', '+91-9876543525', 'Yepme', 'new', 'social_media', 'Voice commerce platform', current_user_id, now() - interval '115 days'),
        ('Swati Bhatt', 'swati.bhatt@zivame.com', '+91-9876543526', 'Zivame', 'contacted', 'advertisement', 'Dynamic pricing engine', current_user_id, now() - interval '116 days'),
        ('Arun Kumar', 'arun.kumar@clovia.com', '+91-9876543527', 'Clovia', 'qualified', 'website', 'Recommendation system', current_user_id, now() - interval '117 days'),
        ('Preeti Agrawal', 'preeti.agrawal@prettysecrets.com', '+91-9876543528', 'PrettySecrets', 'lost', 'referral', 'Vendor consolidation', current_user_id, now() - interval '118 days'),
        ('Vishal Gupta', 'vishal.gupta@bewakoof.com', '+91-9876543529', 'Bewakoof', 'new', 'social_media', 'Sustainability tracking', current_user_id, now() - interval '119 days'),
        ('Riya Shah', 'riya.shah@thesouledstore.com', '+91-9876543530', 'The Souled Store', 'contacted', 'advertisement', 'Customer journey analytics', current_user_id, now() - interval '120 days');

        -- Update the updated_at timestamps to match created_at for consistency
        UPDATE public.leads SET updated_at = created_at WHERE user_id = current_user_id;
        
        RAISE NOTICE 'Successfully created 120 leads for user %', current_user_id;
    ELSE
        RAISE NOTICE 'No authenticated user found. Please login first.';
    END IF;
END $$;
