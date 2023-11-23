-- Retrieve Employment Insurance (EI) premium details for each taxpayer, ordered by the taxpayer's name and tax year in descending order
SELECT * FROM vw_ei_premiums
ORDER BY "Taxpayer''s Name", "Tax Year" DESC;
