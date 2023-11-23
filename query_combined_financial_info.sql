-- Get detailed financial information for each taxpayer, combining income details with CPP contributions and EI premiums.
-- The query joins taxpayer information, income details, total income, CPP contributions, and EI premiums for the tax years 2022 and 2023.
-- Results are ordered by taxpayer ID and tax year.

SELECT
  t.taxpayer_id AS "Taxpayer ID",
  t.firstname_lastname AS "Taxpayer''s Name",
  t.marital_status AS "Marital Status",
  t.date_of_birth AS "Date of Birth",
  t.spouse_firstname_lastname AS "Spouse''s Name",
  t.city AS "City",
  t.province AS "Province",
  i.tax_year AS "Tax Year",
  i.employment_income AS "Employment Income",
  i.commissions AS "Commissions",
  i.dividends_income AS "Dividends Income",
  i.interest_and_other_investment_income AS "Interest and Other Investment Income",
  i.taxable_capital_gains AS "Taxable Capital Gains",
  i.other_income AS "Other Income",
  ti."Total Income" AS "Total Income",
  cpp."CPP Contribution" AS "CPP Contribution",
  ei."EI Premiums" AS "EI Premiums"
FROM
  taxpayers t
JOIN
  income i ON t.taxpayer_id = i.taxpayer_id
JOIN
  vw_total_income ti ON t.taxpayer_id = ti."Taxpayer ID" AND i.tax_year = ti."Tax Year"
JOIN
  vw_cpp_contribution cpp ON t.taxpayer_id = cpp."Taxpayer ID" AND i.tax_year = cpp."Tax Year"
JOIN
  vw_ei_premiums ei ON t.taxpayer_id = ei."Taxpayer ID" AND i.tax_year = ei."Tax Year"
WHERE
  i.tax_year IN (2022, 2023)
ORDER BY
  t.taxpayer_id, i.tax_year;