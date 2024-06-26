  WITH po_f AS
       ( SELECT pi.name AS pizzeria_name
           FROM person_order  AS po
                JOIN menu     AS m  ON po.menu_id = m.id
		        JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
                JOIN person   AS pe ON po.person_id = pe.id  AND pe.gender = 'female' ),
       po_m AS 
       ( SELECT pi.name AS pizzeria_name
           FROM person_order  AS po
                JOIN menu     AS m  ON po.menu_id = m.id
		        JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
                JOIN person   AS pe ON po.person_id = pe.id  AND pe.gender = 'male' )
(  SELECT pizzeria_name
     FROM po_f
   EXCEPT
   SELECT pizzeria_name
     FROM po_m )
    UNION
(  SELECT pizzeria_name
     FROM po_m
   EXCEPT
   SELECT pizzeria_name
     FROM po_f )
 ORDER BY 1