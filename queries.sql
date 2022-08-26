SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT name FROM animals WHERE date_of_birth::date >= '2016-01-01' AND date_of_birth::date <= '2019-12-31';
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
 ALTER TABLE animals ADD COLUMN species text;
 UPDATE animals SET species = unspecified;
ROLLBACK;
UPDATE animals SET species ='digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species <> 'digimon';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

DELETE FROM animals WHERE date_of_birth::date > '2022-01-01';
SAVEPOINT FRSTDELETE;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACk TO FRSTDELETE;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) AS attempts FROM animals GROUP BY neutered ORDER BY attempts DESC;
SELECT name, MIN(weight_kg) AS min_wight,MAX(weight_kg) AS max_weight FROM animals GROUP BY name;
SELECT name, AVG(escape_attempts) FROM animals WHERE date_of_birth::date >= '1990-01-01' AND date_of_birth::date <= '2000-12-31' GROUP BY name;

-- Write queries (JOIN)
SELECT name, date_of_birth, weight_kg, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;
SELECT full_name, name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
SELECT DISTINCT COUNT(*), species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1 OR species.id = 2 GROUP BY species_id, species.name;
SELECT full_name, name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Jennifer Orwell';
SELECT full_name, name, escape_attempts FROM animals JOIN owners ON animals.owner_id = owners.id WHERE escape_attempts = 0 AND full_name = 'Dean Winchester';
SELECT full_name, COUNT(owner_id) AS total FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY full_name ORDER BY total DESC LIMIT 1;