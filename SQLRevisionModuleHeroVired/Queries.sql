1. Write a query to fetch all the vehicle model name whose production started in 2022.
Query:-
SELECT model_name 
FROM Model 
WHERE first_production_year = 2022;


2. Write a query to fetch all the brand names for Germany.
query:-
SELECT make_name 
FROM Make 
WHERE Country = 'Germany';
