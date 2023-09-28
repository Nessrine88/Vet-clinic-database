INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Agumon', '2020-02-03', 0, TRUE, 10.23),
('Gabumon', '2018-11-15', 2, TRUE, 8),
('Pikachu', '2021-01-07', 1, FALSE, 15.04),
('Devimon','2017-05-12', 5, TRUE, 11),


('Charmander', '2020-02-08', 0, FALSE, -11),
('Plantmon', '2021-11-15', 2, TRUE, -5.7),
('Squirtle', '1993-04-02', 3, FALSE, -12.13),
('Angemon', '2005-06-12', 1, TRUE, -45),
('Boarmon', '2005-06-07', 7, TRUE, 20.4),
('Blossom', '1998-10-13', 3, TRUE, 17),
('Ditto', '2022-04-14', 4, TRUE, 22);



-- //owners table

INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- species table 
INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

-- update animals species_id
UPDATE animals
SET species_id = CASE
    WHEN name LIKE '%mon' THEN 1
    ELSE 2 
END;


-- Update owner_id for animals based on owner's name
UPDATE animals
SET owner_id = (
  SELECT id
  FROM owners
  WHERE owners.full_name = CASE
    WHEN animals.name = 'Agumon' THEN 'Sam Smith'
    WHEN animals.name = 'Gabumon' OR animals.name = 'Pikachu' THEN 'Jennifer Orwell'
    WHEN animals.name = 'Devimon' OR animals.name = 'Plantmon' THEN 'Bob'
    WHEN animals.name IN ('Charmander', 'Blossom', 'Ditto', 'Squirtle') THEN 'Melody Pond'
    WHEN animals.name IN ('Angemon', 'Boarmon') THEN 'Dean Winchester'
    ELSE 'Jodie Whittaker'
  END
);

