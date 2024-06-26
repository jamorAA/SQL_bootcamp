(  SELECT pi.name, COUNT(po.order_date) AS count, 'order' AS action_type
     FROM person_order  AS po
          JOIN menu     AS m  ON po.menu_id = m.id
          JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
 GROUP BY pi.name
 ORDER BY 2 DESC
    LIMIT 3 )
    UNION
(  SELECT pi.name, COUNT(pv.visit_date) AS count, 'visit' AS action_type
     FROM person_visits AS pv
          JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
 GROUP BY pi.name
 ORDER BY 2 DESC
    LIMIT 3 )
 ORDER BY 3, 2 DESC