CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species VARCHAR(70);

CREATE TABLE owners(
 id INT GENERATED ALWAYS AS IDENTITY,
 full_name VARCHAR(100),
 age INT,
 PRIMARY KEY(id)
);

CREATE TABLE species(
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(80),
 PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT
 REFERENCES species(id)
 ON DELETE CASCADE;
 
ALTER TABLE animals ADD COLUMN owner_id INT
 REFERENCES owners(id)
 ON DELETE CASCADE;

CREATE TABLE vets (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(50),
	age INT,
	date_of_graduation DATE
);

CREATE TABLE specializations (
	vets_id INT NOT NULL,
	species_id INT NOT NULL,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE CASCADE,
	FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE,
	PRIMARY KEY (vets_id, species_id)
);

CREATE TABLE visits (
	vets_id INT NOT NULL,
	animals_id INT NOT NULL,
    date_of_visit DATE,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE CASCADE,
	FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE CASCADE,
	PRIMARY KEY (vets_id, animals_id, date_of_visit)
);
-- Add an email column to your owners table

-- performance audit
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
CREATE INDEX animal_id_asc ON visits (animals_id ASC);

CREATE INDEX vet_id_asc ON visits (vets_id ASC);

CREATE INDEX email_asc ON owners (email ASC);

