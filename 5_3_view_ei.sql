-- Create a view to calculate Employment Insurance (EI) premiums for each taxpayer
CREATE OR REPLACE VIEW vw_ei_premiums AS
SELECT
  t.taxpayer_id AS "Taxpayer ID",
  t.firstname_lastname AS "Taxpayer''s Name",
  i.tax_year AS "Tax Year",
  i.employment_income AS "Employment Income",
  ROUND(
    CASE
      WHEN i.employment_income <= ei.ei_max_insurable_amt THEN
        i.employment_income * ei.ei_rate
      ELSE
        ei.ei_max_insurable_amt * ei.ei_rate
    END,
    2
  ) AS "EI Premiums"
FROM
  taxpayers t
JOIN
  income i ON t.taxpayer_id = i.taxpayer_id
JOIN
  employment_insurance_premiums ei ON i.tax_year = ei.tax_year
ORDER BY
  t.taxpayer_id;
