SQL
What is DBMS?
- Database management system
What is RDBMS?
- Relational database management system
- Stores data into tables(columns and rows)
- SQL Server is an example of RDBMS
What does SQL stand for?
- Structured Query Language
Who determines the standards for SQL?
- ANSI (American national Standards Institute)
What are the versions of SQL?
- 86th to 2016
Users vs Schemas?
- USERS = SCHEMAS
There are 4 main categories of SQL statements
- DDL(Data definition language)
o CREATE, ALTER, DROP
o In ALTER you can add/remove columns and constraints
o Examples of constraints
♣ Primary key used to ID a row or record, null values are not allowed
• Primary key = unique key + not null constraint
♣ Unique constraint null values are allowed
♣ Foreign key a column in a table that refers to the primary key of another table
♣ Check
♣ Default
♣ Index
♣ Not Null
- DML (Data Manipulation Language)
o SELECT, DELETE, INSERT, UPDATE
o Objects created using DML:
♣ Table
♣ Index it is used retrieve data faster
• Optimizes access to data in a shema
♣ View it is a stored query
♣ Sequence
♣ Synonym
o SELECT: if you are using 2 or more tables:
♣ You need a parent/child or primary key/foreign key relationship
♣ You will also need to use joins when you are getting data from 1 or more tables
♣ Types of joins”
• Inner join
o Returns records that have matching values in both tables
• Left join
o Return all records from the left table, and the matched records from the right table
• Right join
o Return all records from the right table, and the matched records from the left table
• Full join
o Return all records when there is a match in either left or right table
- DCL (Data Control Language)
o Control the level of access that users have
o GRANT, REVOKE
- TCL (Transaction Control Language)
o COMMIT, ROLLBACK
o Savepoint partial rollback
What is the difference between truncate and drop?
- Truncate will keep the table structure and delete the rows and you can’t rollback
o Empties the table
- Drop will drop the entire table
What are set operators?
- They combine two component queries into one result
- Queries containing set operators are called Compound queries
- Examples of set operators
o Union - All distinct rows selected by either query
o Union all - All rows selected by either query, including all duplicates
o Intersect - All distinct rows selected by both queries
o Minus - All distinct rows selected by the first query but not the second
What is the UNION Operator?
- It is used to combine the results of two SELECT statements
- They must have the same number of columns and data types AND be in the same order
What is the difference between ORDER BY and GROUP BY?
- Order by is only for sorting purposes
- Group by used with aggregate functions (COUNT, MAX, MIN, SUM, AVG) to group the result-set by one or more columns
What is the difference between the WHERE and HAVING clause?  
- Where is used to filter records from a result
- HAVING is used to filer values from a group
o Used with group by
What is the purpose of JOIN in SQL?  
- Combines one or more tables in a relational database
How do you select all rows and columns of a table in SQL?  
- SELECT * FROM…
When using NULL..
- ___ IS Null (Correct)
- ___ = NULL (incorrect)
o because null is not equal to null or null is not not equal to null
What is a subquery?
- Query with in a larger query
What are examples of oracle datatypes?
- Char
- Number
- Float
- Integer
- Varchar2
What is normalization?
- It is a process to remove redundancy across tables
- Instead of having multiple of the same fields in different tables you can consolidate them into and ID so you are able to refer to one ID .
Difference between INNER JOIN and OUTER JOIN?
-
What is a foreign/primary key?  
- A primary key uniquely identifies each row in a database
o Can’t contain null values!!!
- A foreign key is used to link data between two tables together
Give a simple CRUD query

---------

HTML
What is CSS and how is it used in web development?
- CSS stands for cascading style sheets
- It is used to describe how the HTML document looks
How do you insert an image in HTML?  
- <img> tag
- and SRC for the source file a
- and if you want to rename the file us ALT
How do you change the background color?  
- <bgcolor = …>
What are the different HTML elements?
- <HTML>
- <Head>
- <Body>
- <Title>
- <br> …etc
HTML Tags
- not all of them come in pairs!
What is the use of DOCTYPE in HTML?  
-
How could you create a button with HTML?  
- <button type=”button”> Click me</button>
How do you comment in HTML?
- <!—comment-->  