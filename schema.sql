CREATE TABLE animals (
    id integer PRIMARY KEY,
    name varchar(500), 
    date_of_birth date, 
    escape_attempts integer, 
    neutered boolean,
    weight_kg decimal,
    species text
);


CREATE TABLE owners (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    full_name text, 
    age integer
);

CREATE TABLE species (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(200)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id integer references species(id);
ALTER TABLE animals ADD COLUMN owner_id integer references owners(id);