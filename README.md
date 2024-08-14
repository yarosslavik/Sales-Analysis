# Sales-Analysis

In this project, I am working with sales data from a specific store. I will be utilizing Python and SQL to accomplish the following tasks:

1. **Data Cleaning:** Remove unnecessary columns and handle missing values.
2. **Data Enhancement:** Add new columns as needed using Python.
3. **Data Analysis:** Perform a comprehensive analysis using SQL.

This process will help transform the raw data into a structured format ready for analysis, enabling valuable insights into the store's sales performance.

# Python

# Loading the Dataset

First, I want to load my data from kaggle.com.
I import Kaggle

![image](https://github.com/user-attachments/assets/d739f0a9-025d-45b3-8335-ffdfa2245422)

# Extracting and Reading Data

I download my dataset from it.
![image](https://github.com/user-attachments/assets/5be8dac1-9007-4b9c-897b-3d35042ee4b3)

The next thing I want to do is to extract my orders from a zip file and I will do it with the help of Python.
![image](https://github.com/user-attachments/assets/d02d4a8f-5636-4463-8329-741b5a56d6da)

Our file is successfully extracted and now we read it and handle NULL values using the library Pandas.
![image](https://github.com/user-attachments/assets/d464bc7c-cf87-483c-bf7d-6ad7226be9a5)

# Preparing Data for SQL

I make our headers more suitable for SQL, lowering them and replacing spaces with underscores. 
![image](https://github.com/user-attachments/assets/0641f6c6-13e3-4cc0-8cd9-5ed38ea65755)

# Adding Calculated Columns

I want to create a new discount column and calculate it using price and discount percent. 
![image](https://github.com/user-attachments/assets/08f5606f-45c3-42fa-879c-423efff2c286)

To my dataset, I add the sales_price column:
![image](https://github.com/user-attachments/assets/a1329342-5bff-485d-b2e1-6b70195f2211)

Using sales_price and cost_price I want to have a column for our profit:
![image](https://github.com/user-attachments/assets/6df4cf1e-5b07-4acb-8b0b-57e8cd6dfcff)

# Data Type Conversion

I want to change the data type of order_date from object to DateTime and I can do it using the Pandas function pd.to_datetime().

![image](https://github.com/user-attachments/assets/40a832fe-9d6f-4d63-8e50-3b5960d3b493)

# Cleaning the Dataset

Then, with the help of Pandas, I deleted columns that I no longer needed.
![image](https://github.com/user-attachments/assets/9c9ecd1b-293d-49a2-a824-f31aed5052a5)

# Extracting dataset to SQL

For analyzing I want to use SQL, so the next step will be to load our data into SQL and I do that with sqlalchemy library.
Here we are setting up a connection to a SQL Server database using the pandas and sqlalchemy.
We mention the ODBC driver, the SQL Server we want to connect, and a specific database we want to connect.
![image](https://github.com/user-attachments/assets/c478f229-c686-4fb2-8c54-29160a56a709)

Then we load our data into that database. 
![image](https://github.com/user-attachments/assets/b740511e-35c3-460f-88fe-adabeb960885)

# SQL

First, we create a table where we store the data.
![image](https://github.com/user-attachments/assets/85256dc3-cd52-449f-b171-c36bcb3f11e8)

Next, we top 10 products that generate the highest revenue. 
I use the SUM function then GROUP it BY product_Id and show only TOP 10 rows.

![image](https://github.com/user-attachments/assets/419e4e47-ee25-46bd-a29a-f836db57b9dc)

The next task is to find the TOP 5 highest-selling products in each region.
In this example I use subqueries.
There is the inner query that selects the SUM of sale_price and GROUP it by region and product_id.
The next layer is ranking. Here I use Window Function ROW_NUMBER() and give each product a rank partitioned by region and ORDERED BY total_revenue descending. 
After that, I select only those rows that have rank_number less than 5.
![image](https://github.com/user-attachments/assets/466e3d16-5cc3-41e8-b19c-85899a326cf8)

I can do it also with Common Table Expressions (CTE). 
My subqueries just become CTEs.
![image](https://github.com/user-attachments/assets/b4135da9-d460-41f0-85f1-a3e07d21453a)

The next task is to find month-over-month growth comparisons for 2022 and 2023 sales.
Here I also use CTEs.
For the first two CTEs I SUM sale_price and GROUP it BY YEAR and MONTH. In the first, I specify to only get results with year 2022 and the second with 2023
In the last query, I select my columns from the first two CTEs JOIN them by MONTH, and calculate the difference in those months within these two years. 
![image](https://github.com/user-attachments/assets/11263661-ca70-462d-9e7c-4fde54ce51c5)

The next task is to find for each category which month had the highest sales.
In the first CTE, we calculate our revenue by MONTH and YEAR. 
Then we assign a rank to each row, partition it by category, and order by total_revenue in descending order. 
After that, we just select those records that have rank numbers equal to one. 
![image](https://github.com/user-attachments/assets/7f8261f4-19d4-4c0f-9381-125183f54f03)

The last task is to find out which subcategory had the highest growth by profit in 2023 compared to 2022.
Firstly, we SUM sale_price and GROUP it BY YEAR and subcategory. 
After that, we used the CASE statement to SUM sales separately which were 2022 and 2023 years. 
The last step is to calculate the difference and divide it by 2022 year sales. Then we order in descending and in that way we get our percentage of the biggest sales difference in subcategories between 2022 and 2023. 
![image](https://github.com/user-attachments/assets/a01f621e-6014-48ce-b6c3-94f6ff2b20ad)

