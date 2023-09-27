CREATE DATABASE vet_clinic;

CREATE TABLE animals(
    id INTEGER,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    species VARCHAR(100),
    PRIMARY KEY(id)
);