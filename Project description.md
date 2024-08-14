# Sales-Analysis

We have data about sales in a specific store. In this project, I will be using Python and SQL. My assignment here is to clean the data, delete unnecessary columns, add columns I need using Python, and do analysis using SQL.

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

