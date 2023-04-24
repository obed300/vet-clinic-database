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

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age int, 
  date_of_graduation date
);

 CREATE TABLE specializations(
 species_id int,
 vet_id int,
  PRIMARY KEY (species_id, vet_id), 
  CONSTRAINT fk_specialization
  FOREIGN KEY(species_id) REFERENCES species (id), 
  FOREIGN KEY(vet_id) REFERENCES vets (id)
 );

 CREATE TABLE visits(
animals_id int,
vets_id int,
  id serial,
PRIMARY KEY (id),  
  CONSTRAINT fk_visits
  FOREIGN KEY(animals_id) REFERENCES animals (id), 
  FOREIGN KEY(vets_id) REFERENCES vets (id)
); 

 ALTER TABLE visits ADD COLUMN date_of_visit date;

 ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX count ON visits (animals_id) WHERE animals_id = 4;
CREATE INDEX vet_id2 ON visits (vets_id) WHERE vets_id = 2;
CREATE INDEX owner1 ON owners (email) WHERE email = 'owner_18327@mail.com'; 