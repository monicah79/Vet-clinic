/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals 
where name like '%mon';

SELECT * from animals 
where date_of_birth between '2016-01-01' and '2019-12-31';

SELECT name from animals 
where neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth from animals 
where name = 'Argumon' OR name = 'Pikachu';

SELECT name, escape_attempts from animals 
where weight_kg > 10.50;

SELECT * from animals 
where neutered = true;

SELECT * from animals 
where name not like 'Gabumon';

SELECT * from animals 
where weight_kg >= 10.40 and weight_kg <= 17.30;

BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';

ROLLBACK;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

BEGIN TRANSACTION;
DELETE FROM animals;

BEGIN TRANSACTION;
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight 
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) as avg_escape_att
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT name as animals_name, full_name as owners_name FROM animals
JOIN owners on animals.owners_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name as animals_names from animals
JOIN species ON animals.species_id = species.id
where species.name = 'Pokemon';

SELECT full_name as owners_names, animals.name as animals_names from animals
RIGHT JOIN owners on animals.owners_id = owners.id;

SELECT COUNT(*) as animals_in_species,species.name from animals
JOIN species on animals.species_id = species.id
GROUP BY species.name;

SELECT * FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owners_id = owners.id
WHERE species.name = 'Digimon' and  owners.full_name = 'Jennifer Orwell';

SELECT * FROM animals
JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Dean Winchester' and  animals.escape_attempts= 0;

SELECT owners.full_name, COUNT(*) as highest_count FROM animals
JOIN owners ON animals.owners_id = owners.id
GROUP BY owners.full_name order by highest_count DESC LIMIT 1;

SELECT animals.name as animal_name FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT COUNT(*) as animals_visited_count FROM visits
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name as vet_name, species.name as specialties FROM vets
LEFT JOIN specializatons ON vets.id = specializatons.vets_id
LEFT JOIN species ON specializatons.species_id = species.id
ORDER BY vets.name;


SELECT animals.name as animals_name FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name as animals_name, COUNT(animals.id) as visits_count FROM animals
JOIN visits ON animals.id = visits.animals_id
GROUP BY animals_name
ORDER BY visits_count DESC
LIMIT 1;

SELECT animals.name as animal_name, date_of_visit FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit ASC
LIMIT 1;

SELECT * FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
ORDER BY date_of_visit DESC
LIMIT 1;

SELECT COUNT(*) as visits_count FROM visits
JOIN animals ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id
JOIN specializatons ON visits.vets_id = specializatons.vets_id
WHERE animals.species_id != specializatons.species_id;

SELECT species.name as species_name, COUNT(*) as species_count FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN species ON animals.species_id = species.id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species_name
ORDER BY species_count DESC
LIMIT 1;

