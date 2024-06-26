CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
	pperson VARCHAR DEFAULT 'Dmitriy',
    pprice  NUMERIC DEFAULT 500,
    pdate   DATE    DEFAULT '2022-01-08'
) RETURNS TABLE(pizzeria_name VARCHAR)
AS $$
BEGIN
    RETURN QUERY
		SELECT DISTINCT pi.name AS pizzeria_name
		  FROM person_visits AS pv
		       JOIN person   AS pe ON pv.person_id = pe.id AND pv.visit_date = pdate AND pe.name = pperson
			   JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
			   JOIN menu     AS m  ON pi.id = m.pizzeria_id AND m.price < pprice;
END;
$$ LANGUAGE plpgsql;

SELECT *
  FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
  FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');