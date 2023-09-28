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