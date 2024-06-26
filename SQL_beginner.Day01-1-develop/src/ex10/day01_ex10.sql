  SELECT pe.name AS person_name,
         pizza_name,
		 pi.name AS pizzeria_name
    FROM person            AS pe
	     JOIN person_order AS po ON pe.id = person_id
		 JOIN menu         AS m  ON menu_id = m.id
		 JOIN pizzeria     AS pi ON pizzeria_id = pi.id
ORDER BY 1, 2, 3