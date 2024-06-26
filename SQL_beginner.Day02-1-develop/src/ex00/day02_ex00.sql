SELECT name, rating
  FROM pizzeria AS p
       LEFT JOIN person_visits AS pv ON p.id = pizzeria_id
 WHERE pv.id IS NULL