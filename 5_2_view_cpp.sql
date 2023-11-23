-- Create a view to calculate Canada Pension Plan (CPP) for each taxpayer
CREATE OR REPLACE VIEW vw_cpp_contribution AS
SELECT
  t.taxpayer_id AS "Taxpayer ID",
  t.firstname_lastname AS "Taxpayer''s Name",
  i.tax_year AS "Tax Year",
  i.employment_income AS "Employment Income",
  ROUND(
    CASE
      WHEN i.employment_income <= cpp.cpp_basic_exemption_amt THEN 0
      WHEN i.employment_income <= cpp.cpp_max_pensionable_amt THEN
        (i.employment_income - cpp.cpp_basic_exemption_amt) * cpp.cpp_rate
      ELSE
        (cpp.cpp_max_pensionable_amt - cpp.cpp_basic_exemption_amt) * cpp.cpp_rate
    END,
    2
  ) AS "CPP Contribution"
FROM
  taxpayers t
JOIN
  income i ON t.taxpayer_id = i.taxpayer_id
JOIN
  canada_pension_plan cpp ON i.tax_year = cpp.tax_year
ORDER BY
  t.taxpayer_id;
