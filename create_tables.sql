-- Create Taxpayers table
CREATE TABLE taxpayers (
  taxpayer_id SERIAL PRIMARY KEY,
  firstname_lastname VARCHAR(100) NOT NULL,
  marital_status VARCHAR(20),
  date_of_birth DATE,
  spouse_firstname_lastname VARCHAR(50),
  city VARCHAR(50),
  province VARCHAR(50)
);

-- Create Income table
CREATE TABLE income (
  income_id SERIAL PRIMARY KEY,
  taxpayer_id INTEGER REFERENCES taxpayers(taxpayer_id),
  tax_year INTEGER,
  employment_income DECIMAL(10, 2) CHECK (employment_income >= 0),
  commissions DECIMAL(10, 2) CHECK (commissions >= 0),
  dividends_income DECIMAL(10, 2) CHECK (dividends_income >= 0),
  interest_and_other_investment_income DECIMAL(10, 2) CHECK (interest_and_other_investment_income >= 0),
  taxable_capital_gains DECIMAL(10, 2) CHECK (taxable_capital_gains >= 0),
  other_income DECIMAL(10, 2) CHECK (other_income >= 0)
);

-- Create Canada Pension Plan (CPP) table
CREATE TABLE canada_pension_plan (
  cpp_id SERIAL PRIMARY KEY,
  taxpayer_id INTEGER REFERENCES taxpayers(taxpayer_id),
  income_id INTEGER REFERENCES income(income_id),
  tax_year INTEGER,
  cpp_rate DECIMAL(3, 4) CHECK (cpp_rate >= 0),
  cpp_max_pensionable_amt DECIMAL(10, 2) CHECK (cpp_max_pensionable_amt >= 0),
  cpp_basic_exemption_amt DECIMAL(10, 2) CHECK (cpp_basic_exemption_amt >= 0)
);

-- Create Employment Insurance (EI) Premiums table
CREATE TABLE employment_insurance_premiums (
  ei_id SERIAL PRIMARY KEY,
  taxpayer_id INTEGER REFERENCES taxpayers(taxpayer_id),
  income_id INTEGER REFERENCES income(income_id),
  tax_year INTEGER,
  ei_rate DECIMAL(3, 4) CHECK (ei_rate >= 0),
  ei_max_insurable_amt DECIMAL(10, 2) CHECK (ei_max_insurable_amt >= 0)
);

-- Create Deduction table
CREATE TABLE deduction (
  deduction_id SERIAL PRIMARY KEY,
  taxpayer_id INTEGER REFERENCES taxpayers(taxpayer_id),
  income_id INTEGER REFERENCES income(income_id),
  tax_year INTEGER,
  rpp_deduction DECIMAL(10, 2) CHECK (rpp_deduction >= 0),
  rrsp_deduction DECIMAL(10, 2) CHECK (rrsp_deduction >= 0),
  annual_union_or_professional_dues DECIMAL(10, 2) CHECK (annual_union_or_professional_dues >= 0),
  child_care_expenses DECIMAL(10, 2) CHECK (child_care_expenses >= 0),
  cpp_enhanced_contributions DECIMAL(10, 2) CHECK (cpp_enhanced_contributions >= 0),
  other_deduction DECIMAL(10, 2) CHECK (other_deduction >= 0),
  capital_gains_deduction DECIMAL(10, 2) CHECK (capital_gains_deduction >= 0)
);

-- Create Federal Tax table
CREATE TABLE federal_tax (
  federal_tax_id SERIAL PRIMARY KEY,
  taxpayer_id INTEGER REFERENCES taxpayers(taxpayer_id),
  deduction_id INTEGER REFERENCES deduction(deduction_id),
  tax_year INTEGER,
  tax_rate DECIMAL(3, 2) CHECK (tax_rate >= 0),
  effective_tax_rate DECIMAL(3, 2) CHECK (effective_tax_rate >= 0)
);

-- Create Federal Non-refundable Tax Credits table
CREATE TABLE federal_non_refundable_tax_credits (
  federal_non_refundable_tax_credits_id SERIAL PRIMARY KEY,
  taxpayer_id INTEGER REFERENCES taxpayers(taxpayer_id),
  federal_tax_id INTEGER REFERENCES federal_tax(federal_tax_id),
  tax_year INTEGER,
  basic_personal_amount DECIMAL(10, 2) CHECK (basic_personal_amount >= 0),
  spouse_or_common_law_partner_amount DECIMAL(10, 2) CHECK (spouse_or_common_law_partner_amount >= 0),
  age_amount DECIMAL(10, 2) CHECK (age_amount >= 0),
  eligible_dependant DECIMAL(10, 2) CHECK (eligible_dependant >= 0),
  base_cpp_contributions DECIMAL(10, 2) CHECK (base_cpp_contributions >= 0),
  ei_premiums DECIMAL(10, 2) CHECK (ei_premiums >= 0),
  canada_employment_amount DECIMAL(10, 2) CHECK (canada_employment_amount >= 0),
  home_buyers_amount DECIMAL(10, 2) CHECK (home_buyers_amount >= 0),
  tuition_amount DECIMAL(10, 2) CHECK (tuition_amount >= 0),
  medical_expenses DECIMAL(10, 2) CHECK (medical_expenses >= 0),
  donations_and_gifts DECIMAL(10, 2) CHECK (donations_and_gifts >= 0)
);

-- Create Federal Refundable Tax Credits table
CREATE TABLE federal_refundable_tax_credits (
  federal_refundable_tax_credits_id SERIAL PRIMARY KEY,
  taxpayer_id INTEGER REFERENCES taxpayers(taxpayer_id),
  federal_non_refundable_tax_credits_id INTEGER REFERENCES federal_non_refundable_tax_credits(federal_non_refundable_tax_credits_id),
  tax_year INTEGER,
  federal_dividend_tax_credit DECIMAL(10, 2) CHECK (federal_dividend_tax_credit >= 0),
  cpp_overpayment DECIMAL(10, 2) CHECK (cpp_overpayment >= 0),
  ei_overpayment DECIMAL(10, 2) CHECK (ei_overpayment >= 0),
  total_income_tax_deducted DECIMAL(10, 2) CHECK (total_income_tax_deducted >= 0)
);

-- Create Ontario Tax table
CREATE TABLE ontario_tax (
  ontario_tax_id SERIAL PRIMARY KEY,
  taxpayer_id INTEGER REFERENCES taxpayers(taxpayer_id),
  deduction_id INTEGER REFERENCES deduction(deduction_id),
  tax_year INTEGER,
  tax_rate DECIMAL(3, 2) CHECK (tax_rate >= 0),
  effective_tax_rate DECIMAL(3, 2) CHECK (effective_tax_rate >= 0)
);

-- Create Ontario Non-refundable Tax Credits table
CREATE TABLE ontario_non_refundable_tax_credits (
  ontario_non_refundable_tax_credits_id SERIAL PRIMARY KEY,
  taxpayer_id INTEGER REFERENCES taxpayers(taxpayer_id),
  ontario_tax_id INTEGER REFERENCES ontario_tax(ontario_tax_id),
  tax_year INTEGER,
  basic_personal_amount DECIMAL(10, 2) CHECK (basic_personal_amount >= 0),
  spouse_or_common_law_partner_amount DECIMAL(10, 2) CHECK (spouse_or_common_law_partner_amount >= 0),
  age_amount DECIMAL(10, 2) CHECK (age_amount >= 0),
  eligible_dependant DECIMAL(10, 2) CHECK (eligible_dependant >= 0),
  cpp_contributions DECIMAL(10, 2) CHECK (cpp_contributions >= 0),
  ei_premiums DECIMAL(10, 2) CHECK (ei_premiums >= 0),
  medical_expenses DECIMAL(10, 2) CHECK (medical_expenses >= 0),
  donations_and_gifts DECIMAL(10, 2) CHECK (donations_and_gifts >= 0),
  ontario_health_premium DECIMAL(10, 2) CHECK (ontario_health_premium >= 0)
);