  SELECT m.pizza_name, pi.name AS pizzeria_name
    FROM person_order AS po
	     JOIN person   AS pe ON po.person_id = pe.id AND pe.name IN ('Denis', 'Anna')
		 JOIN menu     AS m  ON po.menu_id = m.id
		 JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
ORDER BY 1, 2