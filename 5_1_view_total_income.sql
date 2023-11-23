-- Create a view to calculate Total Income for each taxpayer
CREATE OR REPLACE VIEW vw_total_income AS
SELECT
  t.taxpayer_id AS "Taxpayer ID",
  t.firstname_lastname AS "Taxpayer''s Name",
  i.tax_year AS "Tax Year",
  SUM(i.employment_income) AS "Employment Income",
  SUM(i.commissions) AS "Commissions",
  SUM(i.dividends_income) AS "Dividends Income",
  SUM(i.interest_and_other_investment_income) AS "Interest and Other Investment Income",
  SUM(i.taxable_capital_gains) AS "Taxable Capital Gains",
  SUM(i.other_income) AS "Other Income",
  SUM(i.employment_income + i.commissions + i.dividends_income +
      i.interest_and_other_investment_income + i.taxable_capital_gains +
      i.other_income) AS "Total Income"
FROM
  taxpayers t
JOIN
  income i ON t.taxpayer_id = i.taxpayer_id
GROUP BY
  t.taxpayer_id, t.firstname_lastname, i.tax_year
ORDER BY
  t.taxpayer_id;