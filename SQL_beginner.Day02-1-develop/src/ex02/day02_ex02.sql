SELECT CASE
              WHEN pe.name IS NOT NULL THEN pe.name
        ELSE '-'
          END AS person_name,
     visit_date,
     CASE
          WHEN pi.name IS NOT NULL THEN pi.name
        ELSE '-'
        END AS pizzeria_name
    FROM person AS pe
         LEFT JOIN person_visits AS pv  ON pe.id = pv.person_id
                                     AND pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
       FULL JOIN pizzeria      AS pi  ON pv.pizzeria_id = pi.id
ORDER BY 1, 2, 3