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
