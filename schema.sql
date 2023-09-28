CREATE DATABASE vet_clinic;

CREATE TABLE animals(
    id INTEGER,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD species varchar(100);

CREATE TABLE owners (
id SERIAL PRIMARY KEY,
full_name VARCHAR(200),
age INTEGER
);

CREATE TABLE species (
    id serial PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE ADD COLUMN species_id INTEGER REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);
