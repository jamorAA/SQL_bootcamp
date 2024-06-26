  SELECT pi1.name AS pizzeria_name
    FROM person_visits AS pv
	     JOIN person   AS pe1 ON pv.person_id = pe1.id AND pe1.name = 'Andrey'
		 JOIN pizzeria AS pi1 ON pv.pizzeria_id = pi1.id
   WHERE pi1.id NOT IN (SELECT pi2.id
						  FROM person_order  AS po 
						       JOIN person   AS pe2 ON po.person_id = pe2.id AND pe2.name = 'Andrey'
					           JOIN menu     AS m   ON po.menu_id = m.id
					           JOIN pizzeria AS pi2 ON m.pizzeria_id = pi2.id)
ORDER BY 1