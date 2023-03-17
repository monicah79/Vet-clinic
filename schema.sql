/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int generated always as identity primary key,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);
ALTER TABLE animals
ADD species VARCHAR(100);

CREATE TABLE owners(
id int generated always as identity primary key,
full_name varchar(100),
age int
);

CREATE TABLE species(
id int generated always as identity primary key,
name varchar (100)
);

ALTER TABLE animals
DROP species;

ALTER TABLE animals
ADD species_id int;

ALTER TABLE animals
ADD constraint fk_species foreign key (species_id)
REFERENCES species (id);

ALTER TABLE animals
ADD owners_id int;

ALTER TABLE animals
ADD constraint fk_owners foreign key (owners_id)
REFERENCES owners (id);
