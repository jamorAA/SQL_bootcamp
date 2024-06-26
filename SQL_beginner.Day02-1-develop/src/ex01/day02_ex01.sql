  SELECT dates::date AS missing_date
    FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-10', '1 day') as dates
         LEFT JOIN person_visits AS pv ON dates = pv.visit_date AND (person_id = 1 OR person_id = 2)
   WHERE id IS NULL
ORDER BY 1