-- Session #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;

-- Session #2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';