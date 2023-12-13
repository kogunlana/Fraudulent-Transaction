COPY public.fraudulent
FROM 'C:\Users\kogun\Downloads\AVI DATASET\Excel\Fraudulent-Transactions-1csv.csv'
delimiter ',' csv header

SELECT * FROM fraudulent

--How many transaction occured per gtranscation type?
SELECT type, count(type)
FROM fraudulent
GROUP BY type

--Which transcation type has the highest numebr for fraudulent transaction?
SELECT type, count(type) as Total, isfraud as frauduelent
FROM fraudulent
GROUP BY type, isfraud
HAVING isfraud =1
ORDER BY Total desc
LIMIT 1

--What is the average fraudulent transcation amount?
SELECT isfraud, ROUND (AVG (amount),2) as Average_amount
FROM fraudulent
GROUP BY isfraud
HAVING isfraud = 1

--What is the maximum fraudulent transcation amount?
SELECT isfraud, max(amount) as Maximum_amount
FROM fraudulent
GROUP BY isfraud
HAVING isfraud = 1

--What is the minimum fraudulent transcation amount? 
SELECT isfraud, min(amount) Minimum_Amount
FROM fraudulent
GROUP BY isfraud
HAVING isfraud = 1

--Top 10 customers with the highest amount defrauded?
SELECT nameorig, isfraud, SUM(amount)
FROM fraudulent
GROUP BY nameorig,isfraud
HAVING isfraud = 1
ORDER BY max(amount) desc
LIMIT 10

--How effective is the bank in flaggin fraud?
SELECT isfraud, count(isfraud),isflaggedfraud
FROM fraudulent
GROUP BY isfraud,isflaggedfraud

##Its not effective


--Who are the Top 20 fraudsters?

SELECT isfraud, namedest, sum(amount)
FROM fraudulent
WHERE isfraud = 1
GROUP BY isfraud,namedest
ORDER BY sum(amount) desc
LIMIT 20