-- 7. ALTER TABLE tasks and verification
-- Q4.1: Rename a Column[cite: 5]
ALTER TABLE passengers RENAME COLUMN passport_number TO travel_document_id;
SELECT * FROM passengers;

-- Q4.2: Change a Column's Data Type[cite: 5]
ALTER TABLE tickets ALTER COLUMN seat_class TYPE VARCHAR(50);
SELECT seat_class FROM tickets;

-- Q4.3: Add or Remove a Column[cite: 5]
ALTER TABLE airlines ADD COLUMN contact_email VARCHAR(100);
SELECT * FROM airlines;

-- 8. Additional INSERT tasks and verification[cite: 7]
-- Q5.1: Insert a Single Record[cite: 5]
INSERT INTO passengers (first_name, last_name, travel_document_id) VALUES ('Fiona', 'Gallagher', 'F6789012');
SELECT * FROM passengers WHERE first_name = 'Fiona';

-- Q5.2: Insert Multiple Records[cite: 5]
INSERT INTO airlines (airline_name, country, contact_email) VALUES 
('Qatar Airways', 'Qatar', 'info@qatar.com'),
('Singapore Airlines', 'Singapore', 'contact@singaporeair.com');
SELECT * FROM airlines WHERE country IN ('Qatar', 'Singapore');

-- Q5.3: Insert a Related Record
INSERT INTO tickets (passenger_id, airline_id, flight_date, seat_class) VALUES (6, 6, '2026-12-01', 'Business');
SELECT * FROM tickets WHERE passenger_id = 6;