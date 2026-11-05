-- 3. Initial data insertion (At least 5 records per table, no manual PKs)
-- Inserting records into parent tables first
INSERT INTO passengers (first_name, last_name, passport_number) VALUES 
('Alice', 'Smith', 'A1234567'),
('Bob', 'Jones', 'B2345678'),
('Charlie', 'Brown', 'C3456789'),
('Diana', 'Prince', 'D4567890'),
('Evan', 'Wright', 'E5678901');

INSERT INTO airlines (airline_name, country) VALUES 
('RwandAir', 'Rwanda'),
('Kenya Airways', 'Kenya'),
('Delta Airlines', 'United States'),
('British Airways', 'UK'),
('Emirates', 'UAE');

-- Inserting into child table after parents
INSERT INTO tickets (passenger_id, airline_id, flight_date, seat_class) VALUES 
(1, 1, '2026-11-01', 'Economy'),
(2, 3, '2026-11-05', 'Business'),
(3, 2, '2026-11-10', 'Economy'),
(4, 5, '2026-11-15', 'First Class'),
(5, 4, '2026-11-20', 'Economy');