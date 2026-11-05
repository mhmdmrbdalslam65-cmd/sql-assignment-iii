-- 4. SELECT tasks
-- Q1.1: Basic Data Retrieval[cite: 4]
SELECT airline_name, country FROM airlines;

-- Q1.2: Conditional Data Retrieval[cite: 4]
SELECT first_name, last_name FROM passengers WHERE passenger_id > 2;

-- Q1.3: Sorted Data Retrieval[cite: 4]
SELECT airline_name, country FROM airlines ORDER BY airline_name ASC;

-- 5. JOIN tasks
-- Q2.1: INNER JOIN[cite: 4]
SELECT passengers.first_name, tickets.flight_date 
FROM passengers 
INNER JOIN tickets ON passengers.passenger_id = tickets.passenger_id;

-- Q2.2: LEFT JOIN[cite: 4]
SELECT airlines.airline_name, tickets.seat_class 
FROM airlines 
LEFT JOIN tickets ON airlines.airline_id = tickets.airline_id;

-- Q2.3: Multi-Table JOIN[cite: 4]
SELECT passengers.first_name, airlines.airline_name, tickets.flight_date 
FROM tickets
JOIN passengers ON tickets.passenger_id = passengers.passenger_id
JOIN airlines ON tickets.airline_id = airlines.airline_id;