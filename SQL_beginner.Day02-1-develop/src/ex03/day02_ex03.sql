    WITH dates AS
         (SELECT gs::date FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-10', '1 day') as gs)
  SELECT gs AS missing_date
    FROM dates
         LEFT JOIN person_visits AS pv ON gs = pv.visit_date AND (person_id = 1 OR person_id = 2)
   WHERE id IS NULL
ORDER BY 1