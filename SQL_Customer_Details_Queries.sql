create database DB1;
use DB1;
select *from sys.databases;

-- Create Table

Create Table Cust_Details
(Customer_ID VARCHAR(5), 
Customer_Name VARCHAR(30),
Date_Of_Birth DATE,
Gender VARCHAR(30),
Marital_Status VARCHAR(10),
Citizenship VARCHAR(30));

-- To view the table

select *from Cust_Details;

-- Insert the values into the table

INSERT INTO Cust_Details (Customer_ID, Customer_Name, Date_Of_Birth, Gender, Marital_Status, Citizenship) 
VALUES 
(1, 'Sana', '1997-07-10', 'Female', 'M', 'Indian'),
(2, 'Jothi', '1997-04-22', 'Male', 'M', 'Indian'),
(3, 'Sun', '1998-01-01', 'Female', 'UM', 'Indian');

-- WHERE condition

select *from Cust_Details 
WHERE Date_Of_Birth = '1997-07-10';

select *from Cust_Bank_Details
WHERE Bank_Name IN ('HDFC','Canara');

--LIKE()

select *from Cust_Bank_Details
WHERE Customer_Name LIKE 'S%';

-- ORDER BY

select *from Cust_Details
ORDER BY Customer_Name Asc;

-- Len()

select Customer_Name, LEN (Customer_Name) As Len_Customer_Name from Cust_Details ; 

-- Left,right,Substring 

select Customer_Name, LEFT(Customer_Name,2) As LEFT_Extracted from Cust_Details
select Customer_Name, RIGHT (Customer_Name,2) As RIGHT_Extracted from Cust_Details
select Customer_Name, SUBSTRING (Customer_Name,2,4) As SubString_Extracted from Cust_Details

-- Day,Month,Year

select Customer_ID, Customer_Name, Date_Of_Birth, DAY (Date_Of_Birth) As DAY_Extracted from Cust_Details
select Customer_ID, Customer_Name, Date_Of_Birth, MONTH (Date_Of_Birth) As Month_Extracted from Cust_Details
select Customer_ID, Customer_Name, Date_Of_Birth, YEAR (Date_Of_Birth) As Year_Extracted from Cust_Details
select CURRENT_TIMESTAMP;

-- ALTER Table

Alter Table Cust_Details ADD Salary int;

-- Update table

UPDATE Cust_Details
SET Salary = 10000
WHERE Customer_Name = 'Sana';

UPDATE Cust_Details
SET Salary = CASE 
                WHEN Customer_Name = 'Jothi' THEN 20000
                WHEN Customer_Name = 'Sun' THEN 40000
             END
WHERE Customer_Name IN ('Jothi', 'Sun');

-- Customer Bank Details (Table2)

create table Cust_Bank_Details (Customer_ID int, Customer_Name Varchar(30), Bank_Name Varchar(30), IFSC_Code VARchar(30));
INSERT INTO Cust_Bank_Details(Customer_ID, Customer_Name, Bank_Name, IFSC_Code)
VALUES
(1,'SANA','HDFC','IFSCHDFC001'),
(2,'Jothi','Indian_Bank','IFSCIB002'),
(3,'SUN','Canara','IFSCcb003');

select *from Cust_Bank_Details;

--UNION Operator

select Customer_ID from Cust_Bank_Details
UNION ALL
select Customer_ID from Cust_Bank_Details;

--Join

SELECT Cust_Details.Customer_ID, Cust_Details.Customer_Name, Cust_Details.Date_Of_Birth, Cust_Bank_Details.Bank_Name, Cust_Bank_Details.IFSC_Code
FROM Cust_Details
FULL OUTER JOIN Cust_Bank_Details
ON Cust_Details.Customer_Name = Cust_Bank_Details.Customer_Name;

-- DELETE the row

DELETE from Cust_Details
WHERE Customer_Name = 'Jothi';









