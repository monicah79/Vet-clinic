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


