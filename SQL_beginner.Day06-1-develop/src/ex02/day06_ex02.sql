  SELECT pe.name,
         m.pizza_name,
         m.price,
         ROUND(m.price * (1 - pd.discount / 100)) AS discount_price,
         pi.name AS pizzeria_name
    FROM person_order          AS po
         JOIN menu             AS m  ON po.menu_id = m.id
         JOIN person_discounts AS pd ON po.person_id = pd.person_id AND m.pizzeria_id = pd.pizzeria_id
         JOIN person           AS pe ON po.person_id = pe.id
         JOIN pizzeria         AS pi ON m.pizzeria_id = pi.id
ORDER BY 1, 2