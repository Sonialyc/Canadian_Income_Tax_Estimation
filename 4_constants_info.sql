-- Insert constants data for Canada Pension Plan (CPP)
INSERT INTO canada_pension_plan (tax_year, cpp_rate, cpp_max_pensionable_amt, cpp_basic_exemption_amt)
VALUES (2022, 0.0570, 64900, 3500),
       (2023, 0.0595, 66600, 3500);

-- Insert constants data for Employment Insurance (EI) Premiums
INSERT INTO employment_insurance_premiums (tax_year, ei_rate, ei_max_insurable_amt)
VALUES (2022, 0.0158, 60300),
       (2023, 0.0163, 61500);
