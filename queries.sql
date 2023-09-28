SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name FROM animals WHERE neutered = TRUE;
SELECT name FROM animals WHERE name!='Gabumon';
SELECT name FROM animals WHERE weight_kg>=10.5 AND weight_kg <= 17.3;


BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
UPDATE animals SET species = 'degimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokimon' WHERE species IS NULL;
DELETE FROM animals;
ROLLBACK;


DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_youngest_animal;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO  delete_youngest_animal;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT (name) FROM animals;
SELECT COUNT (name) FROM animals WHERE escape_attempts = 0;
SELECT COUNT (name) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals;
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth IS BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


-- update animals species_id
UPDATE animals
SET species_id = CASE
    WHEN name LIKE '%mon' THEN 1
    ELSE 2 
END;

-- queries
SELECT a.name AS animal_name
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.name AS animal_name
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name AS owner_name, a.name AS animal_name
FROM owners AS o
LEFT JOIN animals AS a ON o.id = a.owner_id;

SELECT s.name AS species_name, COUNT(*) AS animal_count
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name AS animal_name
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.name AS animal_name
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name AS owner_name, COUNT(*) AS animal_count
FROM owners AS o
LEFT JOIN animals AS a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;

-- Vet clinic database: add "join table" for visits

