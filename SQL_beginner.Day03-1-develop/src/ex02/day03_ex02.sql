  SELECT pizza_name, price, pi.name AS pizzeria_name
    FROM menu AS m
         JOIN pizzeria AS pi ON pizzeria_id = pi.id
         LEFT JOIN person_order AS po ON m.id = po.menu_id
   WHERE po.id IS NULL
ORDER BY 1, 2