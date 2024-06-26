  SELECT p.name
    FROM person AS p
   WHERE EXISTS (SELECT po.id
        		   FROM person_order AS po
			            JOIN menu AS m ON po.menu_id = m.id
			      WHERE p.id = po.person_id
			            AND p.gender = 'female'
			            AND m.pizza_name = 'pepperoni pizza')
         AND EXISTS (SELECT po.id
			           FROM person_order AS po
			                JOIN menu AS m ON po.menu_id = m.id
			          WHERE p.id = po.person_id
			                AND p.gender = 'female'
			                AND m.pizza_name = 'cheese pizza')
ORDER BY 1