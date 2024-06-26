  SELECT order_date,
         CONCAT(name, ' (age:', age, ')') AS person_information
    FROM person_order AS po
	     JOIN person  AS p  ON po.person_id = p.id
ORDER BY 1, 2