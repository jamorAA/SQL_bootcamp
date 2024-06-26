  WITH pv_f AS
       ( SELECT pi.name AS pizzeria_name
           FROM person_visits AS pv
                JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
                JOIN person   AS pe ON pv.person_id = pe.id   AND pe.gender = 'female' ),
       pv_m AS 
       ( SELECT pi.name AS pizzeria_name
           FROM person_visits AS pv
                JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
                JOIN person   AS pe ON pv.person_id = pe.id   AND pe.gender = 'male' )
(  SELECT pizzeria_name
     FROM pv_f
   EXCEPT ALL
   SELECT pizzeria_name
     FROM pv_m )
    UNION ALL
(  SELECT pizzeria_name
     FROM pv_m
   EXCEPT ALL
   SELECT pizzeria_name
     FROM pv_f )
 ORDER BY 1