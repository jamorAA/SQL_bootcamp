  SELECT pe.name, COUNT(pv.visit_date) AS count_of_visits
    FROM person_visits AS pv
	     JOIN person   AS pe ON pv.person_id = pe.id
GROUP BY pe.name
  HAVING COUNT(pv.visit_date) > 3