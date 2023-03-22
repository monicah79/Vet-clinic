CREATE DATABASE clinic


CREATE TABLE patients(
  id BIGSERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    data_of_birth DATE NOT NULL,
    primary key (id)
);

CREATE TABLE medicacl_histories(
    id BIGSERIAL NOT NULL,
        admitted_at TIMESTAMP NOT NULL,
       patient_id INT REFERENCES patients(id),
        status VARCHAR(100) NOT NULL,
        index (patient_id),
);

CREATE TABLE invoices(
    id BIGSERIAL NOT NULL,
        total_amount DECIMAL(10,2) NOT NULL,
        generated_at TIMESTAMP,
        payed_at TIMESTAMP,
        medicacl_histories_id INT REFERENCES medicacl_histories(id),
        primaty key (id),
        index (medicacl_histories_id),
);

CREATE TABLE  treatments(
    id BIGSERIAL NOT NULL,
        type VARCHAR(100) NOT NULL,
        name VARCHAR(100) NOT NULL,
        preferred_doctor VARCHAR(100) NOT NULL,
        primary key (id),
);

CREATE TABLE  treatments_medicacl_histories(
   medical_history_id BIGINT NOT NULL REFERENCES medical_histories(id),
    treatment_id BIGINT NOT NULL REFERENCES treatments(id),
    primary key (medical_history_id, treatment_id),
    index (medical_history_id, treatment_id),
);

CREATE TABLE invoice_items(
    id BIGSERIAL NOT NULL,
    unit_price decimal NOT NULL,
    Quantity int,
    total_price decimal,
    invoice_id int REFERENCES invoice (id),
    treatment_id int REFERENCES treatments (id),
    INDEX (invoice_id, treatment_id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoice_items (invoice_id, treatment_id);
CREATE INDEX ON treatments_medicacl_histories (medical_history_id, treatment_id);



