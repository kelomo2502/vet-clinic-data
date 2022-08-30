SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified'; 
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT update_weight;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO update_weight;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY (neutered);
SELECT species, MIN(weight_kg), MAX(weight_kg)FROM animals GROUP BY(species);
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY(species);

SELECT animals.* FROM animals
 JOIN owners ON animals.owner_id = owners.id
 WHERE owners.full_name = 'Melody Pond';

SELECT animals.* FROM animals
 JOIN species ON animals.species_id = species.id
 WHERE species.name = 'Pokemon';

SELECT owners.full_name,animals.name FROM owners
 LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(*) FROM animals
 JOIN species ON animals.species_id = species.id
 GROUP BY species.name;

SELECT animals.* FROM animals
 JOIN owners ON animals.owner_id = owners.id
 JOIN species ON animals.species_id = species.id
 WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
 
SELECT animals.* FROM animals
 JOIN owners ON animals.owner_id = owners.id
 WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name,COUNT(*) FROM owners 
 JOIN animals ON owners.id = animals.owner_id
 GROUP BY owners.full_name
 ORDER BY count DESC LIMIT 1;


 SELECT animals.name, visits.date_of_visit from animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id =visits.vets_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;
-------------------------------------------------
SELECT COUNT(*) FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez';
-------------------------------------------------
SELECT vets.name, species.name FROM vets
FULL JOIN specializations ON specializations.vets_id = vets.id
FULL JOIN species ON species.id = specializations.species_id;
-------------------------------------------------
SELECT animals.name, visits.date_of_visit FROM animals
 JOIN visits ON visits.animals_id = animals.id
 JOIN vets ON vets.id = visits.vets_id
 WHERE vets.name = 'Stephanie Mendez' AND
 (visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30');

 SELECT animals.name, COUNT(animals.name) FROM animals
 JOIN visits ON visits.animals_id = animals.id
 GROUP BY animals.name
 ORDER BY count DESC LIMIT 1;

 SELECT animals.name, visits.date_of_visit FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT animals.*, vets.*,visits.date_of_visit FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
ORDER BY visits.date_of_visit DESC;

SELECT vets.name AS "non-specialize vet", COUNT(vets.name) AS "number of visit" FROM vets
FULL JOIN specializations ON specializations.vets_id = vets.id
FULL JOIN visits ON visits.vets_id = vets.id
WHERE specializations.vets_id IS NULL
GROUP BY vets.name;

SELECT species.name "species she gets the most", COUNT(*) FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name 
ORDER BY count DESC LIMIT 1;
