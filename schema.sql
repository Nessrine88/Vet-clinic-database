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

-- Vet clinic database: add "join table" for visits

CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    specialization_id SERIAL PRIMARY KEY,
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id)
);

CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    vet_id INTEGER REFERENCES vets(id),
    animal_id INTEGER REFERENCES animals(animal_id),
    visit_date DATE
);
