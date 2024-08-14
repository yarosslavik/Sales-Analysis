# Sales-Analysis

We have data about sales in a specific store. In this project I will be using Python and SQL. My assigment here is to clean the data, delete unnecessary column, add columns which I need using Python and do analysis using SQL.

First of all, I want to load my data from kaggle.com:
I import kaggle
![image](https://github.com/user-attachments/assets/d739f0a9-025d-45b3-8335-ffdfa2245422)

and then download my dataset from it.
![image](https://github.com/user-attachments/assets/5be8dac1-9007-4b9c-897b-3d35042ee4b3)

The next thing I want to do is to extract my orders from a zip file and I will do it with the help of Python.
![image](https://github.com/user-attachments/assets/d02d4a8f-5636-4463-8329-741b5a56d6da)

Our file is successfuly extracted and now we read it and handle NULL values using library Pandas.
![image](https://github.com/user-attachments/assets/d464bc7c-cf87-483c-bf7d-6ad7226be9a5)

Then we make our headers more sutiable for SQL, so they are lowered and spaces are replaced with underscores. 
![image](https://github.com/user-attachments/assets/0641f6c6-13e3-4cc0-8cd9-5ed38ea65755)

After that I want to create new column for discount and I will calculate it using price and discount percent. 
![image](https://github.com/user-attachments/assets/08f5606f-45c3-42fa-879c-423efff2c286)


