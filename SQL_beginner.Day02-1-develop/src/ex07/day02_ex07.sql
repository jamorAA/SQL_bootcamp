SELECT pi.name AS pizzeria_name
  FROM person_visits AS pv
       JOIN person   AS pe  ON pv.person_id = pe.id
	                       AND pe.name = 'Dmitriy'
	                       AND visit_date = '2022-01-08'
	   JOIN menu     AS m   ON pv.pizzeria_id = m.pizzeria_id
	                       AND m.price < 800
	   JOIN pizzeria AS pi  ON m.pizzeria_id = pi.id