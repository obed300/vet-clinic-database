CREATE TABLE animals(
  id SERIAL PRIMARY KEY,
  name varchar(100), 
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal,
  species varchar(100)
);

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name varchar(100),
  age int
  );
  
  CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name varchar(100)
  );
  
  ALTER TABLE animals DROP COLUMN species;
  ALTER TABLE animals ADD COLUMN species_id integer, 
  ADD CONSTRAINT fk_species FOREIGN KEY (species_id)
  REFERENCES species(id);
  
ALTER TABLE animals ADD COLUMN owners_id integer, 
ADD CONSTRAINT fk_owners
FOREIGN KEY (owners_id)
REFERENCES owners(id);