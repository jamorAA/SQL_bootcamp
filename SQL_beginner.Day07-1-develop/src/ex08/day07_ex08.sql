  SELECT pe.address, pi.name, COUNT(order_date) AS count_of_orders
    FROM person_order  AS po
         JOIN person   AS pe ON po.person_id = pe.id
		 JOIN menu     AS m  ON po.menu_id = m.id
		 JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
GROUP BY pe.address, pi.name
ORDER BY 1, 2