INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (1,'Agumon','2020-02-03',0,true,10.23);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (2,'Gabumon','2018-11-15',2,true,8);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (3,'Pikachu','2021-01-07',1,false,15.04);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (4,'Devimon','2017-05-12',5,true,11);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (5,'Charmander','2020-02-08',0,false,11);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (6,'Plantmon','2021-1-15',2,true,5.7);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (7,'Squirtle','1993-04-2',3,false,12.13);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (8,'Angemon','2005-06-12',1,true,45);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (9,'Boarmon','2005-06-7',7,true,20.4);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (10,'Blossom','1998-10-13',3,true,17);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (11,'Ditto','2022-10-13',4,true,22);

BEGIN;

UPDATE animals
SET species = 'unspecified';

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

UPDATE animals
SET weight_kg = weight_kg * -1;
SAVEPOINT savepoint_5;

ROLLBACK TO savepoint_5;

COMMIT;

INSERT INTO owners(full_name,age)
VALUES('Sam Smith',34),
      ('Jennifer Orwell',19),
      ('Bob',45),
      ('Melody Pond', 77),
      ('Dean Winchester', 14),
      ('Jodie Whittaker', 38);
  
INSERT INTO species(name)
VALUES('Pokemon'),
      ('Digimon');
      
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name::text LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;


UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon','Pikachu');

UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon','Plantmon');

UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander','Squirtle','Blossom');

UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon','Boarmon');


INSERT INTO vets(name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(species_id, vet_id)
VALUES 
((SELECT id FROM species WHERE name='Pokemon'), (SELECT id FROM vets WHERE name='William Tatcher')),
((SELECT id FROM species WHERE name= 'Digimon'), (SELECT id FROM vets WHERE name='Stephanie Mendez')),
((SELECT id FROM species WHERE name= 'Pokemon'), (SELECT id FROM vets WHERE name='Stephanie Mendez')),
((SELECT id FROM species WHERE name= 'Digimon'), (SELECT id FROM vets WHERE name='Jack Harkness'));

 INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-02-2'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-5'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-8'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-4'),
((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');