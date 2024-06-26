  SELECT order_date,
         CONCAT(name, ' (age:', age, ')') AS person_information
    FROM person_order
	     NATURAL JOIN (SELECT name, age, id AS person_id FROM person) AS q
ORDER BY 1, 2