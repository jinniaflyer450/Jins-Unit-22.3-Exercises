--1: Join the two tables so that every column and record appears, regardless of whether there is an owner id or not.
SELECT * FROM owners o FULL JOIN vehicles v ON o.id = v.owner_id;

--2: Count the number of cars for each owner.
--Display owner's first name, last name, and count of vehicles.
--First name should be ordered in ascending order.
SELECT o.first_name, o.last_name, COUNT(*) AS count 
FROM vehicles v 
JOIN owners o ON v.owner_id = o.id 
GROUP BY o.id ORDER BY o.first_name;

--3: Count the number of cars for each owner and display the average price for each of the cars as integers.
--Display owner's first and last name, average price of vehicles, and vehicle count.
--The first name should be ordered in descending order (ORDER BY first_name DESC).
--Only display (HAVING) results with more than one vehicle and an average price greater than 10000.
SELECT o.first_name, o.last_name, ROUND(AVG(v.price)) AS average_price, COUNT(*)
FROM vehicles v 
JOIN owners o ON v.owner_id = o.id 
GROUP BY o.id HAVING COUNT(*) > 1 AND ROUND(AVG(v.price)) > 10000 ORDER BY o.first_name DESC;

--Note on 3: When I try to use the alias 'average_price' later in the query, Git Bash gives me 'column average_price does not exist'.
--Help?
