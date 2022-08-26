-- SCHEMA

CREATE TABLE animals (
    id BIGSERIAL PRIMARY KEY,
    name varchar(300), 
    date_of_birth date, 
    escape_attempts integer, 
    neutered boolean,
    weight_kg decimal,
    species text
);

-- THE TABLES

CREATE TABLE owners (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    full_name text, 
    age integer
);

CREATE TABLE species (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(300)
);

-- TABLE MODIFICATIONS
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id integer references species(id);
ALTER TABLE animals ADD COLUMN owner_id integer references owners(id);