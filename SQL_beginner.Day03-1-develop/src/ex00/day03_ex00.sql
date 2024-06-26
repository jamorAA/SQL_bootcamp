  SELECT pizza_name, price, pi.name AS pizzeria_name, visit_date
    FROM menu AS m
         JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
         JOIN person_visits AS pv ON pi.id = pv.pizzeria_id
         JOIN person AS pe ON person_id = pe.id
   WHERE pe.name = 'Kate' AND price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3