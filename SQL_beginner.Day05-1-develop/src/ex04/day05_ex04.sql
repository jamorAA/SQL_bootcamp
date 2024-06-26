CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan to off;

EXPLAIN ANALYSE
 SELECT pizzeria_id, pizza_name
   FROM menu
  WHERE pizza_name < 'g'