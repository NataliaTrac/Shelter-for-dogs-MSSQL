# Dog Shelter Database Documentation

## Introduction

This document provides a comprehensive overview of the Dog Shelter Database. Designed to streamline the management of dog records, adoptions, treatments, volunteer involvement, and specialized care, this database system facilitates efficient shelter operations through structured data organization and relationship mapping.

## Table of Contents

1. [Introduction](#introduction)
2. [Database Schema](#database-schema)
3. [Table Descriptions](#table-descriptions)
    - [Dog](#dog)
    - [Person](#person)
    - [Volunteer](#volunteer)
    - [Treatment](#treatment)
    - [Specialization](#specialization)
    - [Dog_Treatment](#dog_treatment)
    - [Specializations](#specializations)
    - [Adoption](#adoption)
    - [ShelterCare](#sheltercare)
4. [Entity Relationships](#entity-relationships)
5. [Installation](#installation)
6. [Usage](#usage)
7. [Data Insertion Examples](#data-insertion-examples)
8. [Query Examples](#query-examples)
9. [Troubleshooting](#troubleshooting)

## Database Schema

The Dog Shelter Database is structured around nine primary tables: `Dog`, `Person`, `Volunteer`, `Treatment`, `Specialization`, `Dog_Treatment`, `Specializations`, `Adoption`, and `ShelterCare`. These tables are interconnected through various primary key and foreign key relationships to ensure data integrity and to facilitate complex queries.

## Table Descriptions

### Dog

- `chip_number`: INT, Primary Key, Unique identifier for each dog.
- `name`: VARCHAR(45), Name of the dog.
- `birth_date`: DATE, Date of birth of the dog.
- `gender`: VARCHAR(20), Gender of the dog.
- `admission_date`: DATE, Date when the dog was admitted to the shelter.

### Person

- `id`: INT, Primary Key, Unique identifier for each person.
- `first_name`: VARCHAR(45), First name of the person.
- `last_name`: VARCHAR(45), Last name of the person.
- `phone_number`: VARCHAR(9), Contact number of the person.

### Volunteer

- `Person_id`: INT, Primary Key, Foreign Key referencing `Person(id)`.
- `status`: VARCHAR(15), Status of the volunteer (Active/Inactive).

### Treatment

- `id`: INT, Primary Key, Unique identifier for each treatment.
- `treatment`: VARCHAR(45), Description of the treatment.

### Specialization

- `id`: INT, Primary Key, Unique identifier for each specialization.
- `specialization_name`: VARCHAR(100), Name of the specialization.

### Dog_Treatment

- `Dog_chip_number`: INT, Foreign Key referencing `Dog(chip_number)`.
- `Treatment_id`: INT, Foreign Key referencing `Treatment(id)`.
- Composite Primary Key (`Dog_chip_number`, `Treatment_id`).

### Specializations

- `Specialization_id`: INT, Foreign Key referencing `Specialization(id)`.
- `Volunteer_Person_id`: INT, Foreign Key referencing `Volunteer(Person_id)`.
- Composite Primary Key (`Specialization_id`, `Volunteer_Person_id`).

### Adoption

- `id`: INT, Primary Key, Unique identifier for each adoption record.
- `Dog_chip_number`: INT, Foreign Key referencing `Dog(chip_number)`.
- `Person_id`: INT, Foreign Key referencing `Person(id)`.
- `adoption_status`: VARCHAR(25), Status of the adoption.
- `date`: DATE, Date of adoption.
- `Volunteer_Person_id`: INT, Foreign Key referencing `Volunteer(Person_id)`.

### ShelterCare

- `Volunteer_Person_id`: INT, Foreign Key referencing `Volunteer(Person_id)`.
- `Dog_chip_number`: INT, Foreign Key referencing `Dog(chip_number)`.
- Composite Primary Key (`Volunteer_Person_id`, `Dog_chip_number`).

## Entity Relationships

The database establishes relationships between entities to mirror the real-world interactions within a dog shelter. For example, `Dog_Treatment` connects dogs with their treatments, facilitating medical record tracking. Similarly, `Adoption` links dogs, adopters (persons), and the volunteer handling the adoption, illustrating the adoption process and the roles involved.

## Installation

To install and set up this database, follow these steps:

1. Ensure you have a relational database management system (RDBMS) such as MySQL, PostgreSQL, or SQLite installed.
2. Create a new database instance in your RDBMS.
3. Execute the provided SQL statements to create the tables and insert the initial data.

## Usage

Use SQL queries to interact with the database. Operations include adding new records, updating existing information, querying for data analysis, and managing relationships between entities.

## Data Insertion Examples

Data insertion into this database involves executing `INSERT INTO` statements for each table. For instance:

```sql
-- Insert a new dog
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (12, 'Daisy', '2022-01-01', 'Female', '2022-02-15');
```
## Query Examples

To query the database, you can use `SELECT` statements. Example:

```sql
-- Find all adopted dogs
SELECT Dog.name, Adoption.adoption_status, Person.first_name, Person.last_name
FROM Adoption
JOIN Dog ON Adoption.Dog_chip_number = Dog.chip_number
JOIN Person ON Adoption.Person_id = Person.id
WHERE Adoption.adoption_status = 'Adopted';
```
## Troubleshooting
Common issues may include constraint violations and referential integrity errors. Ensure all foreign keys exist before referencing them and follow the correct data formats.
