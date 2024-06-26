  SELECT DISTINCT pe.name
    FROM person_order AS po
         JOIN person  AS pe ON po.person_id = pe.id
ORDER BY 1 