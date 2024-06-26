INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT (SELECT MAX(id) + pe.id FROM person_order),
       pe.id,
	   (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
	   '2022-02-25'
  FROM person AS pe