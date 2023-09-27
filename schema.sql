CREATE DATABASE vet_clinic;

CREATE TABLE animals(
    id INTEGER,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weigth_kg DECIMAL
);