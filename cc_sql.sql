CREATE DATABASE credit_card_database ;
USE credit_card_database;

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);


CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);



SELECT * FROM cc_detail;

SELECT * FROM cust_detail;


SET GLOBAL local_infile = 1;

SHOW GLOBAL VARIABLES LIKE 'local_infile';




LOAD DATA LOCAL INFILE 'D:\\DK\\PowerBI\\Credit Card Report\\credit_card.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  Client_Num,
  Card_Category,
  Annual_Fees,
  Activation_30_Days,
  Customer_Acq_Cost,
  @week_start_date,
  Week_Num,
  Qtr,
  current_year,
  Credit_Limit,
  Total_Revolving_Bal,
  Total_Trans_Amt,
  Total_Trans_Ct,
  Avg_Utilization_Ratio,
  Use_Chip,
  Exp_Type,
  Interest_Earned,
  Delinquent_Acc
)
SET Week_Start_Date = STR_TO_DATE(@week_start_date, '%d-%m-%Y');





LOAD DATA LOCAL INFILE 'D:\\DK\\PowerBI\\Credit Card Report\\customer.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;





LOAD DATA LOCAL INFILE 'D:\\DK\\PowerBI\\Credit Card Report\\cc_add.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  Client_Num,
  Card_Category,
  Annual_Fees,
  Activation_30_Days,
  Customer_Acq_Cost,
  @week_start_date,
  Week_Num,
  Qtr,
  current_year,
  Credit_Limit,
  Total_Revolving_Bal,
  Total_Trans_Amt,
  Total_Trans_Ct,
  Avg_Utilization_Ratio,
  Use_Chip,
  Exp_Type,
  Interest_Earned,
  Delinquent_Acc
)
SET Week_Start_Date = STR_TO_DATE(@week_start_date, '%d-%m-%Y');





LOAD DATA LOCAL INFILE 'D:\\DK\\PowerBI\\Credit Card Report\\cust_add.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




-- SET SQL_SAFE_UPDATES = 0;

-- DELETE FROM cc_detail;
-- DELETE FROM cust_detail;

-- SET SQL_SAFE_UPDATES = 1;



