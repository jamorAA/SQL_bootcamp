  SELECT pi.name,
         COUNT(po.order_date)   AS count_of_orders,
		 ROUND(AVG(m.price), 2) AS average_price,
		 MAX(m.price)           AS max_price,
		 MIN(m.price)           AS min_price
    FROM person_order  AS po
	     JOIN menu     AS m  ON po.menu_id = m.id
		 JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
GROUP BY pi.name
ORDER BY 1