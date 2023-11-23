-- Insert data for Taxpayer 1 (Single)
INSERT INTO taxpayers (firstname_lastname, marital_status, date_of_birth, city, province)
VALUES ('Rosalynne Jones', 'Single', '1992-10-31', 'Markham', 'Ontario');

-- Insert data for Taxpayer 2 (Couple - Husband)
INSERT INTO taxpayers (firstname_lastname, marital_status, date_of_birth, spouse_firstname_lastname, city, province)
VALUES ('Tim Ellison', 'Married', '1986-12-24', 'Sophia Ellison', 'Richmond Hill', 'Ontario');

-- Insert data for Taxpayer 3 (Couple - Wife)
INSERT INTO taxpayers (firstname_lastname, marital_status, date_of_birth, spouse_firstname_lastname, city, province)
VALUES ('Sophia Ellison', 'Married', '1989-12-25', 'Tim Ellison', 'Richmond Hill', 'Ontario');

-- Insert data for Taxpayer 4 (Single)
INSERT INTO taxpayers (firstname_lastname, marital_status, date_of_birth, city, province)
VALUES ('Jane Smith', 'Single', '1990-01-01', 'Stoufville', 'Ontario');

-- Insert data for Taxpayer 5 (Single)
INSERT INTO taxpayers (firstname_lastname, marital_status, date_of_birth, city, province)
VALUES ('John Brown', 'Single', '2000-12-31', 'Toronto', 'Ontario');