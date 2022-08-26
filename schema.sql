CREATE TABLE animals (
    id BIGSERIAL PRIMARY KEY,
    name varchar(200), 
    date_of_birth date, 
    escape_attempts integer, 
    neutered boolean,
    weight_kg decimal,
    species text
);

-- creating tables

CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY, 
    full_name text, 
    age integer
);

CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY, 
    name VARCHAR(250)
);

-- Modify animals table:
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id integer references species(id);
ALTER TABLE animals ADD COLUMN owner_id integer references owners(id);