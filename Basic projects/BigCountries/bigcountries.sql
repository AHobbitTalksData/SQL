/* Creating and selecting the database */
Create database BigCountries;
use BigCountries;

/* Creating a table called "world" */
CREATE table world ( 
name varchar (255),
continent varchar (255),
area int, 
population int, 
gdp bigint,
PRIMARY KEY (name)
);

/* Adding information into the table*/ 
insert into world (name, continent, area, population, gdp)
values 
	( 'Afghanistan', 'Asia', 652230, 25500100, 20343000000),
	('Albania', 'Europe', 28748, 2831741, 12960000000),
        ('Algeria', 'Africa', 2381741, 37100000, 188681000000),
	('Andorra', 'Europe', 468, 78115, 3712000000),
	('Angola', 'Africa', 1246700, 20609294, 100990000000);

/* Filtering according to instructions*/
SELECT name, population, area from world WHERE area>=3000000 or population >= 25000000;
