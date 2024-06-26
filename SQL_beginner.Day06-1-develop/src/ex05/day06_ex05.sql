COMMENT ON  TABLE person_discounts             IS 'Table for storing customer discounts in the respective pizzerias';
COMMENT ON COLUMN person_discounts.id          IS 'Unique identifiers for this table';
COMMENT ON COLUMN person_discounts.person_id   IS 'A person''s unique identifier from an order list';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The unique identifier of the pizzeria where the order was placed by the person';
COMMENT ON COLUMN person_discounts.discount    IS 'The discount value calculated based on the number of orders placed';