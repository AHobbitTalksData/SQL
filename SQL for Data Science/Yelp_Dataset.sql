-- Author: Jessy Acuña 
-- Date: 04/24/23

Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

		SELECT COUNT(*)
		FROM table; /* change "table" for each table below */ 

	i. 	Attribute table = 10000
	ii. 	Business table = 10000
	iii. 	Category table = 10000
	iv. 	Checkin table = 10000
	v. 	elite_years table = 10000 
	vi. 	friend table = 10000
	vii. 	hours table = 10000
	viii. 	photo table = 10000
	ix. 	review table = 10000
	x. 	tip table = 10000
	xi. 	user table = 10000




2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

		SELECT COUNT(DISTINCT(key))
		FROM table;  /* change "table" for each table below */ 

	i. 	Business = id: 10000
	ii. 	Hours = business_id: 1562
	iii. 	Category = business_id: 2643
	iv. 	Attribute = business_id: 1115
	v. 	Review = id:10000, business_id: 8090, user_id: 9581
	vi. 	Checkin = business_id: 493
	vii. 	Photo = id: 10000, business_id: 6493
	viii. 	Tip = user_id: 537, business_id: 3979
	ix. 	User = id: 10000
	x. 	Friend = user_id: 11
	xi. 	Elite_years = user_id: 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: "no"
	
	
	SQL code used to arrive at answer:
	
		SELECT COUNT(*)
		FROM user
		WHERE id IS NULL OR 
		  name IS NULL OR 
		  review_count IS NULL OR 
		  yelping_since IS NULL OR
		  useful IS NULL OR 
		  funny IS NULL OR 
		  cool IS NULL OR 
		  fans IS NULL OR 
		  average_stars IS NULL OR 
		  compliment_hot IS NULL OR 
		  compliment_more IS NULL OR 
		  compliment_profile IS NULL OR 
		  compliment_cute IS NULL OR 
		  compliment_list IS NULL OR 
		  compliment_note IS NULL OR 
		  compliment_plain IS NULL OR 
		  compliment_cool IS NULL OR 
		  compliment_funny IS NULL OR 
		  compliment_writer IS NULL OR 
		  compliment_photos IS NULL; 	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

		SELECT AVG(column)
		FROM table;


	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.71
		
	
	ii. Table: Business, Column: Stars
	
		min: 1 		max: 5		avg: 3.65
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.01
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.94
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000	avg: 24.30
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
		SELECT city, SUM(review_count) AS reviews
		FROM business
		GROUP BY city
		ORDER BY reviews DESC;
	
	Copy and Paste the Result Below:
	
		+-----------------+---------+
		| city            | reviews |
		+-----------------+---------+
		| Las Vegas       |   82854 |
		| Phoenix         |   34503 |
		| Toronto         |   24113 |
		| Scottsdale      |   20614 |
		| Charlotte       |   12523 |
		| Henderson       |   10871 |
		| Tempe           |   10504 |
		| Pittsburgh      |    9798 |
		| Montréal        |    9448 |
		| Chandler        |    8112 |
		| Mesa            |    6875 |
		| Gilbert         |    6380 |
		| Cleveland       |    5593 |
		| Madison         |    5265 |
		| Glendale        |    4406 |
		| Mississauga     |    3814 |
		| Edinburgh       |    2792 |
		| Peoria          |    2624 |
		| North Las Vegas |    2438 |
		| Markham         |    2352 |
		| Champaign       |    2029 |
		| Stuttgart       |    1849 |
		| Surprise        |    1520 |
		| Lakewood        |    1465 |
		| Goodyear        |    1155 |
		+-----------------+---------+
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

			SELECT stars, SUM(review_count) AS count
			FROM business
			WHERE city == 'Avon'
			GROUP BY stars;	

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
			+-------+-------+
			| stars | count |
			+-------+-------+
			|   1.5 |    10 |
			|   2.5 |     6 |
			|   3.5 |    88 |
			|   4.0 |    21 |
			|   4.5 |    31 |
			|   5.0 |     3 |
			+-------+-------+	

ii. Beachwood

SQL code used to arrive at answer:

			SELECT stars, SUM(review_count) AS count
			FROM business
			WHERE city == 'Beachwood'
			GROUP BY stars;


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
		
			+-------+-------+
			| stars | count |
			+-------+-------+
			|   2.0 |     8 |
			|   2.5 |     3 |
			|   3.0 |    11 |
			|   3.5 |     6 |
			|   4.0 |    69 |
			|   4.5 |    17 |
			|   5.0 |    23 |
			+-------+-------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
		SELECT id, name, review_count
		FROM user
		ORDER BY review_count DESC
		LIMIT 3;
		
	Copy and Paste the Result Below:
		+------------------------+--------+--------------+
		| id                     | name   | review_count |
		+------------------------+--------+--------------+
		| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
		| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
		| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
		+------------------------+--------+--------------+		


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
		Yes. The longer the stay on Yelp, the higher the fan count. The 
		code I used is: 

		SELECT id, name, review_count, fans, yelping_since
		FROM user
		ORDER BY fans DESC;
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: There are more words with love than hate. 

	
	SQL code used to arrive at answer:
	SELECT COUNT(*)
	FROM review										
	WHERE text LIKE "%love%";	

	SELECT COUNT(*)
	FROM review										
	WHERE text LIKE "%hate%";

	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
		SELECT id, name, fans
		FROM user
		ORDER BY fans DESC
		LIMIT 10;
	
	Copy and Paste the Result Below:
		+------------------------+-----------+------+
		| id                     | name      | fans |
		+------------------------+-----------+------+
		| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
		| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
		| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
		| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
		| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
		| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
		| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
		| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
		| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
		| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
		+------------------------+-----------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
Yes, they do. 

ii. Do the two groups you chose to analyze have a different number of reviews?
Yes, they do.          
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
The postal code for  M6R 1X3  gets 2-3 stars. The rest of postal codes are between 4 to 5 stars. 

SQL code used for analysis:
	
		SELECT B.name,B.review_count, H.hours, postal_code,
			   CASE
				  WHEN hours LIKE "%monday%" THEN 1
				  WHEN hours LIKE "%tuesday%" THEN 2
				  WHEN hours LIKE "%wednesday%" THEN 3
				  WHEN hours LIKE "%thursday%" THEN 4
				  WHEN hours LIKE "%friday%" THEN 5
				  WHEN hours LIKE "%saturday%" THEN 6
				  WHEN hours LIKE "%sunday%" THEN 7
			   END AS ord,
			   CASE
				  WHEN B.stars BETWEEN 2 AND 3 THEN '2-3 stars'
				  WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
			   END AS star_rating
		FROM business B INNER JOIN hours H
		ON B.id = H.business_id
		INNER JOIN category C
		ON C.business_id = B.id
		WHERE (B.city == 'Toronto'
		AND
		C.category LIKE 'Food')
		AND
		(B.stars BETWEEN 2 AND 3
		OR
		B.stars BETWEEN 4 AND 5)
		GROUP BY stars,ord
		ORDER BY ord,star_rating ASC;

My results are: 
+--------------+--------------+-----------------------+-------------+-----+-------------+
| name         | review_count | hours                 | postal_code | ord | star_rating |
+--------------+--------------+-----------------------+-------------+-----+-------------+
| Loblaws      |           10 | Monday|8:00-22:00     | M6R 1X3     |   1 | 2-3 stars   |
| Cabin Fever  |           26 | Monday|16:00-2:00     | M6P 1A6     |   1 | 4-5 stars   |
| Loblaws      |           10 | Tuesday|8:00-22:00    | M6R 1X3     |   2 | 2-3 stars   |
| Halo Brewery |           15 | Tuesday|15:00-21:00   | M6H 1V5     |   2 | 4-5 stars   |
| Cabin Fever  |           26 | Tuesday|18:00-2:00    | M6P 1A6     |   2 | 4-5 stars   |
| Loblaws      |           10 | Wednesday|8:00-22:00  | M6R 1X3     |   3 | 2-3 stars   |
| Halo Brewery |           15 | Wednesday|15:00-21:00 | M6H 1V5     |   3 | 4-5 stars   |
| Cabin Fever  |           26 | Wednesday|18:00-2:00  | M6P 1A6     |   3 | 4-5 stars   |
| Loblaws      |           10 | Thursday|8:00-22:00   | M6R 1X3     |   4 | 2-3 stars   |
| Halo Brewery |           15 | Thursday|15:00-21:00  | M6H 1V5     |   4 | 4-5 stars   |
| Cabin Fever  |           26 | Thursday|18:00-2:00   | M6P 1A6     |   4 | 4-5 stars   |
| Loblaws      |           10 | Friday|8:00-22:00     | M6R 1X3     |   5 | 2-3 stars   |
| Halo Brewery |           15 | Friday|15:00-21:00    | M6H 1V5     |   5 | 4-5 stars   |
| Cabin Fever  |           26 | Friday|18:00-2:00     | M6P 1A6     |   5 | 4-5 stars   |
| Loblaws      |           10 | Saturday|8:00-22:00   | M6R 1X3     |   6 | 2-3 stars   |
| Halo Brewery |           15 | Saturday|11:00-21:00  | M6H 1V5     |   6 | 4-5 stars   |
| Cabin Fever  |           26 | Saturday|16:00-2:00   | M6P 1A6     |   6 | 4-5 stars   |
| Loblaws      |           10 | Sunday|8:00-22:00     | M6R 1X3     |   7 | 2-3 stars   |
| Halo Brewery |           15 | Sunday|11:00-21:00    | M6H 1V5     |   7 | 4-5 stars   |
| Cabin Fever  |           26 | Sunday|16:00-2:00     | M6P 1A6     |   7 | 4-5 stars   |
+--------------+--------------+-----------------------+-------------+-----+-------------+		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:

There are more open businesses (8480) than closed ones (1520).         
         
ii. Difference 2:
In average, there are more reviews on the open businesses (31) than closed ones (23).          
         
         
SQL code used for analysis:

		SELECT COUNT(DISTINCT(id)), AVG(review_count), SUM(review_count), AVG(stars), is_open
		FROM business
		GROUP BY is_open
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

I wanted to know which are the best hours to get a review. The SQL code I provided will retrieve a list of business names, cities, hours and review counts, ordered by descending stars. However, it does not provide any information about which hours are the best to be open in order to receive a good review. 

One approach could be to calculate the average rating of each business during different hours of operation and identify which hours have the highest average rating. This analysis could help businesses optimize their hours of operation to receive the most positive reviews. Additionally, factors such as the type of business, location, and target audience may also play a role in determining the best hours of operation for receiving positive reviews, and would need to be considered in further analysis.
                           
                  
iii. Output of your finished dataset:

+----------------------------------------+-----------+-----------------------+---------------+
| name                                   | city      | hours                 |     avg_stars |
+----------------------------------------+-----------+-----------------------+---------------+
| Slyman's Restaurant                    | Cleveland | Friday|6:00-14:30     |           5.0 |
| Slyman's Restaurant                    | Cleveland | Monday|6:00-14:30     |           5.0 |
| Slyman's Restaurant                    | Cleveland | Saturday|9:00-13:00   |           5.0 |
| Slyman's Restaurant                    | Cleveland | Thursday|6:00-14:30   |           5.0 |
| Slyman's Restaurant                    | Cleveland | Tuesday|6:00-14:30    |           5.0 |
| Slyman's Restaurant                    | Cleveland | Wednesday|6:00-14:30  |           5.0 |
| Bootleggers Modern American Smokehouse | Phoenix   | Friday|11:00-22:00    | 4.66666666667 |
| Bootleggers Modern American Smokehouse | Phoenix   | Monday|11:00-22:00    | 4.66666666667 |
| Bootleggers Modern American Smokehouse | Phoenix   | Saturday|11:00-22:00  | 4.66666666667 |
| Bootleggers Modern American Smokehouse | Phoenix   | Sunday|11:00-22:00    | 4.66666666667 |
| Bootleggers Modern American Smokehouse | Phoenix   | Thursday|11:00-22:00  | 4.66666666667 |
| Bootleggers Modern American Smokehouse | Phoenix   | Tuesday|11:00-22:00   | 4.66666666667 |
| Bootleggers Modern American Smokehouse | Phoenix   | Wednesday|11:00-22:00 | 4.66666666667 |
| Big Wong Restaurant                    | Las Vegas | Friday|10:00-23:00    |           4.5 |
| Big Wong Restaurant                    | Las Vegas | Monday|10:00-23:00    |           4.5 |
| Big Wong Restaurant                    | Las Vegas | Saturday|10:00-23:00  |           4.5 |
| Big Wong Restaurant                    | Las Vegas | Sunday|10:00-23:00    |           4.5 |
| Big Wong Restaurant                    | Las Vegas | Thursday|10:00-23:00  |           4.5 |
| Big Wong Restaurant                    | Las Vegas | Tuesday|10:00-23:00   |           4.5 |
| Big Wong Restaurant                    | Las Vegas | Wednesday|10:00-23:00 |           4.5 |
| West Side Market                       | Cleveland | Friday|7:00-18:00     |           4.5 |
| West Side Market                       | Cleveland | Monday|7:00-16:00     |           4.5 |
| West Side Market                       | Cleveland | Saturday|7:00-18:00   |           4.5 |
| West Side Market                       | Cleveland | Sunday|10:00-16:00    |           4.5 |
| West Side Market                       | Cleveland | Wednesday|7:00-16:00  |           4.5 |
+----------------------------------------+-----------+-----------------------+---------------+
         
iv. Provide the SQL code you used to create your final dataset:

SELECT b.name, b.city, h.hours, AVG(r.stars) as avg_stars
FROM business b
JOIN hours h ON b.id = h.business_id
JOIN review r ON b.id = r.business_id
GROUP BY b.id, h.hours
ORDER BY AVG(r.stars) DESC, b.name, h.hours;
