WITH q AS (
       (  SELECT pi.name AS name, COUNT(po.order_date) AS count, 'order' AS action_type
            FROM person_order  AS po
                 JOIN menu     AS m  ON po.menu_id = m.id
                 RIGHT JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
        GROUP BY pi.name )
           UNION
       (  SELECT pi.name AS name, COUNT(pv.visit_date) AS count, 'visit' AS action_type
            FROM person_visits AS pv
                 RIGHT JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
        GROUP BY pi.name ) )
  SELECT name, SUM(count) AS total_count
    FROM q
GROUP BY name
ORDER BY 2 DESC, 1