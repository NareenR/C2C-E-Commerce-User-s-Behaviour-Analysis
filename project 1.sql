
## 1.Create new schema as ecommerce

CREATE DATABASE ecommerce;

USE ecommerce;

## 2.Import .csv file users_data into MySQL

## Go to navigator unders, schemas select ecommerce database ,then right click on ecommerce1 and go for table data import wizard
## SELECT the file path for users_data.csv then click next
## Select the existing table type ecommerce.tabl1 and click next
## In configure import setting  check the column and encodind after that click next
## In import data click next, data importation  process starts

SELECT * FROM table1;

##3.Run SQL command to see the structure of table

DESC table1;

## 4.Run SQL command to select first 100 rows of the database

SELECT * FROM table1 LIMIT 100;

## 5.How many distinct values exist in table for field country and language

SELECT COUNT(DISTINCT country),COUNT(DISTINCT language) FROM table1;

## 6.Check whether male users are having maximum followers or female users.

SELECT gender, SUM(socialNbFollowers) "social Followers" FROM table1 GROUP BY gender;

SELECT (gender="F",SUM(socialNbFollowers))> (gender="M",SUM(socialNbFollowers)) FROM table1;

## 7.Calculate the total users those

##   A.Uses Profile Picture in their Profile

	 SELECT  COUNT(*) "Uses Profile Picture"FROM table1 WHERE hasProfilePicture="TRUE";

##	 B.Uses Application for Ecommerce platform

	 SELECT  COUNT(*) "ANY APP users" FROM table1 WHERE hasAnyApp="TRUE";

## 	 C.Uses Android app
	 SELECT  COUNT(*) "ANDROID USERS" FROM table1 WHERE hasAndroidApp="TRUE";

## 	 D.Uses ios app
	 SELECT  COUNT(*) "IOS USERS" FROM table1 WHERE hasIosApp="TRUE";

## 8.Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.

SELECT country ,SUM(productsBought)  "total number of buyers for each country" FROM table1 GROUP BY country ORDER BY SUM(productsBought) DESC;

## 9.Calculate the average number of sellers for each country and sort the result in ascending order of total number of sellers

SELECT country ,AVG(productsSold)  " average number of sellers for each country" FROM table1 GROUP BY country ORDER BY sum(productsSold);

## 10.Display name of top 10 countries having maximum products pass rate.

SELECT country,max(productsPassRate) "maximum products pass rate" FROM table1 GROUP BY country ORDER BY MAX(productsPassRate) DESC LIMIT 10;

## 11.Calculate the number of users on an ecommerce platform for different language choices.

SELECT language,COUNT(*) "number of users on an ecommerce platform" FROM table1 GROUP BY language;

## 12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.

SELECT SUM(productsWished) "product in a wishlist",sum(socialProductsLiked) " like socially on an ecommerce platform" FROM table1 WHERE gender="F" ;

## 13.Check the choice of male users about being seller or buyer.

SELECT SUM(productsSold),SUM(productsBought) FROM table1 WHERE gender="M";

## 14.Which country is having maximum number of buyers?

SELECT country, SUM(productsBought) FROM table1 GROUP BY country ORDER BY SUM(productsBought) DESC LIMIT 1 ;


## 15.List the name of 10 countries having zero number of sellers.


SELECT country,productsSold FROM table1 GROUP BY country HAVING SUM(productsSold)=0 LIMIT 10;

## 16.Display record of top 110 users who have used ecommerce platform recently.

SELECT identifierHash,daysSinceLastLogin FROM table1 ORDER BY daysSinceLastLogin LIMIT 110;

## 17.Calculate the number of female users those who have not logged in since last 100 days.

SELECT gender,identifierHash,daysSinceLastLogin FROM table1 WHERE gender="F" AND daysSinceLastLogin>100 ORDER BY daysSinceLastLogin;

## 18.Display the number of female users of each country at ecommerce platform.

SELECT country,COUNT(gender) " number of female users"  FROM table1 WHERE gender="F" GROUP BY country ORDER BY COUNT(gender) DESC;

## 19.Display the number of male users of each country at ecommerce platform.

SELECT country,COUNT(gender) " number of male users"  FROM table1 WHERE gender="M" GROUP BY country ORDER BY COUNT(gender) DESC;

## 20.Calculate the average number of products sold and bought on ecommerce platform by male users for each country

SELECT country,AVG(productsSold) "AVERAGE OF PRODUCT SOLD",AVG(productsBought) "AVERAGE OF PRODUCT BOUGHT" FROM table1 WHERE gender="M" GROUP BY country ORDER BY "AVERAGE OF PRODUCT SOLD";