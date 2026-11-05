
-- 2. Table creation and constraints
-- Parent Table 1[cite: 2]
CREATE TABLE passengers (
    passenger_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    passport_number VARCHAR(20) NOT NULL UNIQUE
);

-- Parent Table 2[cite: 2]
CREATE TABLE airlines (
    airline_id SERIAL PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- Child Table (Contains 2 Foreign Keys)[cite: 2]
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    passenger_id INT,
    airline_id INT,
    flight_date DATE NOT NULL,
    seat_class VARCHAR(20),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
);