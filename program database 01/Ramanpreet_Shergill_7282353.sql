--Ramanpreet Kaur Shergill
--7282353
--Assignment 2
PRINT 'Ramanpreet Kaur Shergill
7282353
Assignment 2'
PRINT''

--Problem 1
--List the number of characters in firstName aliased as ‘First Name Length’ for all persons. Show each column length only once. Sort the results by number of characters in descending order.
PRINT 'List the number of characters in firstName aliased as ‘First Name Length’ for all persons. Show each column length only once. Sort the results by number of characters in descending order.'
PRINT''
SELECT DISTINCT LEN(firstName)'First Name Length'
FROM Person ORDER BY 'First Name Length' DESC

--Problem 2
--List the firstName, the first letter of firstName aliased as ‘First Initial’, and the first letter of firstName in lower case aliased as ‘Lower First Initial’ for all persons whose lastName starts with ‘P’. Sort the results by firstName in ascending order. Use LEFT() throughout.
PRINT 'List the firstName, the first letter of firstName aliased as ‘First Initial’, and the first letter of firstName in lower case aliased as ‘Lower First Initial’ for all persons whose lastName starts with ‘P’. Sort the results by firstName in ascending order. Use LEFT() throughout.'
PRINT ''
SELECT firstName, LEFT(firstName,1) 'First Initial', LOWER(LEFT(firstName,1))'Lower First Initial'
FROM Person
WHERE lastName LIKE 'P%' ORDER BY firstName

--Problem 3
--List the lastName, the first seven letters of lastName aliased as ‘First Seven’, and the first seven letters of lastName in lower case aliased as ‘Lower First Seven’ for all persons whose lastName starts with ‘P’. Sort the results by lastName in ascending order. Use SUBSTRING() throughout.
PRINT 'List the lastName, the first seven letters of lastName aliased as ‘First Seven’, and the first seven letters of lastName in lower case aliased as ‘Lower First Seven’ for all persons whose lastName starts with ‘P’. Sort the results by lastName in ascending order. Use SUBSTRING() throughout.'
PRINT ''
SELECT lastName, SUBSTRING(lastName,1,7) 'First Name', LOWER (SUBSTRING(lastName,1,7))'Lower First Seven'
FROM Person
WHERE lastName LIKE 'P%' ORDER BY lastName

--Problem 4
--List user id’s for all persons whose last name starts with ‘P’. The user id consists of the first letter of the first name and the first seven letters of the last name, all in lower case. Alias the user id ‘User Id’, and sort the results in ascending ‘User ID’ order. Use either LEFT() or SUBSTRING() as you wish.
PRINT 'List user id’s for all persons whose last name starts with ‘P’. The user id consists of the first letter of the first name and the first seven letters of the last name, all in lower case. Alias the user id ‘User Id’, and sort the results in ascending ‘User ID’ order. Use either LEFT() or SUBSTRING() as you wish.'
PRINT ''
SELECT SUBSTRING(firstName,1,1)+SUBSTRING(lastName,1,7)'User Id', LOWER (SUBSTRING(firstName,1,1)+SUBSTRING(lastName,1,7))
FROM Person
WHERE lastName LIKE 'P%'ORDER BY 'User Id'

--Problem 5
--List number aliased as ‘Course Code’ and name aliased as ‘Course Name’ for all courses that have the word ‘Database’ in their name. Do not use LIKE.
PRINT 'List number aliased as ‘Course Code’ and name aliased as ‘Course Name’ for all courses that have the word ‘Database’ in their name. Do not use LIKE.'
PRINT ''
SELECT number 'Course Code', name 'Course Name'
FROM Course
WHERE CHARINDEX('Database',name) > 0

--Problem 6
--What is the date today, 30 days from today, 60 days from today, 90 days from today, and 120 days from today?  Alias the columns 'Today', '30 Days', '60 Days', '90 Days' and '120 Days' respectively.  Display all dates in YYYY.MM.DD format.
PRINT 'What is the date today, 30 days from today, 60 days from today, 90 days from today, and 120 days from today?  Alias the columns `Today`, `30 Days`, `60 Days`, `90 Days` and `120 Days` respectively.  Display all dates in YYYY.MM.DD format.'
PRINT ''
SELECT CONVERT(CHAR(10), GETDATE(),102) 'Today',
	   CONVERT(CHAR(10), GETDATE()+30,102) '30 days',
	   CONVERT(CHAR(10), GETDATE()+60,102) '60 days',
	   CONVERT(CHAR(10), GETDATE()+90,102) '90 days',
	   CONVERT(CHAR(10), GETDATE()+120,102) '120 days'
	   
--Problem 7
--List number and birthDate for all employees sorted in ascending birthDate order formatted exactly like this:
PRINT 'List number and birthDate for all employees sorted in ascending birthDate order formatted exactly like this:'
PRINT ''
PRINT 'a.'
SELECT 'Employee Number:'+emp.number, 'Year:'+CONVERT (CHAR(4),YEAR(prsn.birthdate)),'Month:'+CONVERT (CHAR(4),MONTH(prsn.birthdate)),'Day:'+CONVERT (CHAR(4),DAY(prsn.birthdate))
FROM Employee emp LEFT OUTER JOIN Person prsn
ON (emp.number=prsn.number) ORDER BY prsn.birthdate
PRINT ''
PRINT 'b.'
SELECT 'Employee Number:'+emp.number, 'Year:'+CONVERT (CHAR(4),DATEPART(YYYY,prsn.birthdate)),'Month:'+CONVERT (CHAR(4),DATEPART(MM,prsn.birthdate)),'Day:'+CONVERT (CHAR(4),DATEPART(DD,prsn.birthdate))
FROM Employee emp LEFT OUTER JOIN Person prsn
ON (emp.number=prsn.number) ORDER BY prsn.birthdate