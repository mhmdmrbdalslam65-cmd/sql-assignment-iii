-- 6. UPDATE tasks and verification
-- Q3.1: Update One Record[cite: 4]
UPDATE airlines SET country = 'United Kingdom' WHERE airline_id = 4;
SELECT * FROM airlines WHERE airline_id = 4;

-- Q3.2: Update Multiple Records[cite: 4]
UPDATE tickets SET seat_class = 'Premium Economy' WHERE seat_class = 'Economy' AND flight_date < '2026-11-12';
SELECT * FROM tickets WHERE seat_class = 'Premium Economy';

-- Q3.3: Conditional Update[cite: 5]
UPDATE airlines SET country = 'USA' WHERE country = 'United States';
SELECT * FROM airlines WHERE country = 'USA';