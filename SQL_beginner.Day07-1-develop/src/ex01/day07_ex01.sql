  SELECT pe.name, COUNT(pv.pizzeria_id) AS count_of_visits
    FROM person_visits AS pv
         JOIN person   AS pe ON pv.person_id = pe.id
GROUP BY pe.name
ORDER BY 2 DESC, 1
   LIMIT 4