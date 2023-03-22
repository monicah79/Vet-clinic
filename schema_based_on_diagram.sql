create database clinic

use clinic

create table patients(
  id BIGSERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    data_of_birth DATE NOT NULL,
    primary key (id)
)

create table medicacl_histories(
    id BIGSERIAL NOT NULL,
        admitted_at TIMESTAMP NOT NULL,
        patients
)
