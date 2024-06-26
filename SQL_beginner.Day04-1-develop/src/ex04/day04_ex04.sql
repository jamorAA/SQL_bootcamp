CREATE VIEW v_symmetric_union AS (
WITH R AS
     (SELECT pv.person_id
        FROM person_visits AS pv
       WHERE visit_date = '2022-01-02'),
     S AS
	 (SELECT pv.person_id
        FROM person_visits AS pv
       WHERE visit_date = '2022-01-06')
 (SELECT person_id
    FROM R
  EXCEPT ALL
  SELECT person_id
    FROM S)
   UNION ALL
 (SELECT person_id
    FROM S
  EXCEPT ALL
  SELECT person_id
    FROM R)
ORDER BY 1 )