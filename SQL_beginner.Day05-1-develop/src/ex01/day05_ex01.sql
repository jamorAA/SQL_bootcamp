SET enable_seqscan to off;

EXPLAIN ANALYZE
 SELECT m.pizza_name, pi.name AS pizzeria_name
   FROM menu AS m
        JOIN pizzeria AS pi ON m.pizzeria_id = pi.id