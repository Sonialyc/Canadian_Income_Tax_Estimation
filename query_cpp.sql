-- Retrieve Canada Pension Plan (CPP) contribution details for each taxpayer, ordered by the taxpayer's name and tax year
SELECT * FROM vw_cpp_contribution
ORDER BY "Taxpayer''s Name", "Tax Year";
