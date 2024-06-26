  SELECT m1.pizza_name AS pizza_name,
         pi1.name      AS pizzeria_name1,
         pi2.name      AS pizzeria_name2,
         m1.price      AS price
    FROM menu AS m1
         JOIN menu     AS m2   ON m1.price = m2.price
		                      AND m1.id > m2.id
							  AND m1.pizza_name = m2.pizza_name
         JOIN pizzeria AS pi1  ON m1.pizzeria_id = pi1.id
         JOIN pizzeria AS pi2  ON m2.pizzeria_id = pi2.id
ORDER BY 1;