  SELECT pe.name
    FROM person_order AS po
	     JOIN person  AS pe  ON po.person_id = pe.id
		                    AND pe.gender = 'male'
		                    AND pe.address IN ('Moscow', 'Samara')
		 JOIN menu    AS m   ON po.menu_id = m.id
		                    AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1 DESC