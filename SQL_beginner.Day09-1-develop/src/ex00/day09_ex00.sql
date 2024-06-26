CREATE TABLE person_audit(
	created    TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
	type_event CHAR(1)                  DEFAULT 'I'               NOT NULL,
	row_id     BIGINT                                             NOT NULL,
	name       VARCHAR,
	age        INT,
	gender     VARCHAR,
	address    VARCHAR,
	CONSTRAINT ch_type_event CHECK(type_event IN ('I', 'D', 'U'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER
AS $trg_person_insert_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit
		SELECT now(), 'I', new.*;
    END IF;
    RETURN NULL;
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
 AFTER INSERT ON person
   FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');