# Airport Management System - SQL Assignment III

## Project Overview
* **Student Name:** [Your Name Here]
* **Student ID:** [Your Student ID Here]
* **Business Idea:** Airport Management System
* **DBMS Used:** PostgreSQL

This project is a relational database designed to manage basic airport operations, including passengers, airlines, and ticketing systems. 

## Database and Table Descriptions
The database consists of three related tables:
1. **`passengers`**: Stores traveler details (first name, last name, and travel document ID).
2. **`airlines`**: Stores airline information (airline name, country, and contact email).
3. **`tickets`**: Stores flight ticket details (flight date and seat class) and acts as the child table linking passengers and airlines.

## Primary and Foreign Key Relationships
* **Primary Keys**: Each table uses an auto-generated `SERIAL` primary key (`passenger_id`, `airline_id`, `ticket_id`) to uniquely identify records.
* **Foreign Keys**: The `tickets` table contains two foreign keys:
  * `passenger_id` references the `passengers` table.
  * `airline_id` references the `airlines` table.
These relationships ensure data integrity by guaranteeing that a ticket can only be assigned to a valid passenger and a valid airline.

## Entity-Relationship Diagram (ERD)
Below is the ERD generated directly from the DBMS application:

![ERD](erd.png)

---

## SQL Practical Tasks & Execution Evidence

*(Note: Screenshots of the actual query results are included below each SQL statement block.)*

### 1. SELECT - Data Retrieval
**Q1.1: Basic Data Retrieval**
* **Objective:** Retrieve airline names and their countries.
```sql
SELECT airline_name, country FROM airlines;
```
* **Explanation:** This query displays a simple list of all airlines operating in the system and their countries of origin.
* **Screenshot:** `[Add result screenshot here]`

**Q1.2: Conditional Data Retrieval**
* **Objective:** Retrieve specific passengers based on their ID.
```sql
SELECT first_name, last_name FROM passengers WHERE passenger_id > 2;
```
* **Explanation:** This retrieves the names of passengers whose ID is strictly greater than 2.
* **Screenshot:** `[Add result screenshot here]`

**Q1.3: Sorted Data Retrieval**
* **Objective:** Retrieve airlines ordered alphabetically by name.
```sql
SELECT airline_name, country FROM airlines ORDER BY airline_name ASC;
```
* **Explanation:** The results are sorted in ascending order based on the airline's name for easier reading.
* **Screenshot:** `[Add result screenshot here]`

### 2. JOIN - Retrieving Related Data
**Q2.1: INNER JOIN**
* **Objective:** Retrieve passenger names and their flight dates.
```sql
SELECT passengers.first_name, tickets.flight_date 
FROM passengers 
INNER JOIN tickets ON passengers.passenger_id = tickets.passenger_id;
```
* **Explanation:** This matches records in both tables, showing only passengers who have booked a ticket.
* **Screenshot:** `[Add result screenshot here]`

**Q2.2: LEFT JOIN**
* **Objective:** Retrieve all airlines and their ticket seat classes, if any.
```sql
SELECT airlines.airline_name, tickets.seat_class 
FROM airlines 
LEFT JOIN tickets ON airlines.airline_id = tickets.airline_id;
```
* **Explanation:** This retrieves every airline in the database, including those that currently have no tickets associated with them.
* **Screenshot:** `[Add result screenshot here]`

**Q2.3: Multi-Table JOIN**
* **Objective:** Create a comprehensive booking report.
```sql
SELECT passengers.first_name, airlines.airline_name, tickets.flight_date 
FROM tickets
JOIN passengers ON tickets.passenger_id = passengers.passenger_id
JOIN airlines ON tickets.airline_id = airlines.airline_id;
```
* **Explanation:** This combines all three tables to show exactly which passenger is flying on which airline and on what date.
* **Screenshot:** `[Add result screenshot here]`

### 3. UPDATE - Modifying Existing Data
**Q3.1: Update One Record**
* **Objective:** Change the country of a specific airline.
```sql
UPDATE airlines SET country = 'United Kingdom' WHERE airline_id = 4;
SELECT * FROM airlines WHERE airline_id = 4;
```
* **Explanation:** Safely modified the country for British Airways from 'UK' to 'United Kingdom' using its unique ID.
* **Screenshot:** `[Add result screenshot here]`

**Q3.2: Update Multiple Records**
* **Objective:** Upgrade early economy flights.
```sql
UPDATE tickets SET seat_class = 'Premium Economy' WHERE seat_class = 'Economy' AND flight_date < '2026-11-12';
SELECT * FROM tickets WHERE seat_class = 'Premium Economy';
```
* **Explanation:** Updated multiple early bookings from Economy to Premium Economy using specific conditions.
* **Screenshot:** `[Add result screenshot here]`

**Q3.3: Conditional Update**
* **Objective:** Standardize country naming conventions.
```sql
UPDATE airlines SET country = 'USA' WHERE country = 'United States';
SELECT * FROM airlines WHERE country = 'USA';
```
* **Explanation:** Replaced 'United States' with the abbreviation 'USA' to match business rules.
* **Screenshot:** `[Add result screenshot here]`

### 4. ALTER TABLE - Modifying Table Structure
**Q4.1: Rename a Column**
* **Objective:** Rename passport number for broader travel document inclusion.
```sql
ALTER TABLE passengers RENAME COLUMN passport_number TO travel_document_id;
SELECT * FROM passengers;
```
* **Explanation:** The column name was updated without losing any existing passenger data.
* **Screenshot:** `[Add result screenshot here]`

**Q4.2: Change a Column's Data Type**
* **Objective:** Increase character limit for seat class descriptions.
```sql
ALTER TABLE tickets ALTER COLUMN seat_class TYPE VARCHAR(50);
SELECT seat_class FROM tickets;
```
* **Explanation:** Expanded the VARCHAR limit to accommodate longer seat class names safely.
* **Screenshot:** `[Add result screenshot here]`

**Q4.3: Add a Column**
* **Objective:** Add contact information to airlines.
```sql
ALTER TABLE airlines ADD COLUMN contact_email VARCHAR(100);
SELECT * FROM airlines;
```
* **Explanation:** Added a new column for airline emails to improve business entity details.
* **Screenshot:** `[Add result screenshot here]`

### 5. INSERT - Adding New Records
**Q5.1: Insert a Single Record**
* **Objective:** Add a new passenger.
```sql
INSERT INTO passengers (first_name, last_name, travel_document_id) VALUES ('Fiona', 'Gallagher', 'F6789012');
SELECT * FROM passengers WHERE first_name = 'Fiona';
```
* **Explanation:** Successfully inserted a new passenger record allowing auto-generation of the primary key.
* **Screenshot:** `[Add result screenshot here]`

**Q5.2: Insert Multiple Records**
* **Objective:** Add two new airlines in a single query.
```sql
INSERT INTO airlines (airline_name, country, contact_email) VALUES 
('Qatar Airways', 'Qatar', 'info@qatar.com'),
('Singapore Airlines', 'Singapore', 'contact@singaporeair.com');
SELECT * FROM airlines WHERE country IN ('Qatar', 'Singapore');
```
* **Explanation:** Added multiple airlines simultaneously utilizing the newly added email column.
* **Screenshot:** `[Add result screenshot here]`

**Q5.3: Insert a Related Record**
* **Objective:** Create a ticket for the newly added passenger and airline.
```sql
INSERT INTO tickets (passenger_id, airline_id, flight_date, seat_class) VALUES (6, 6, '2026-12-01', 'Business');
SELECT * FROM tickets WHERE passenger_id = 6;
```
* **Explanation:** Verified foreign key integrity by linking the new ticket to valid existing parent records.
* **Screenshot:** `[Add result screenshot here]`

---

## Conclusion
Through this project, I learned how to properly design a relational database by defining structured tables with appropriate data types. I gained practical experience implementing Primary and Foreign Keys to maintain data integrity between parent and child tables. I successfully practiced combining data across multiple tables using `INNER JOIN` and `LEFT JOIN`, and modifying existing data safely using the `UPDATE` statement with specific `WHERE` conditions. Finally, I learned how to alter live table structures using `ALTER TABLE` operations without corrupting existing records.