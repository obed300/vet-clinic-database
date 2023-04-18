SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT * FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT * FROM animals
WHERE neutered = true AND escape_attempts <3;

SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

SELECT * FROM animals
WHERE neutered = true;

SELECT * FROM animals
WHERE name <> 'Gabumon';

SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT 
  COUNT(*) AS animals_count, 
  COUNT(CASE WHEN escape_attempts = 0 THEN 1 ELSE NULL END) AS no_escape,
  AVG(weight_kg) AS avg_weight,
  MIN(weight_kg) AS min_weight,
  MAX(weight_kg) AS max_weight
FROM 
  animals;

SELECT 
  animals.name,
  animals.escape_attempts AS most_escape,
  animals.neutered
FROM 
  animals
WHERE 
  animals.escape_attempts = (
    SELECT 
      MAX(escape_attempts)
    FROM 
      animals
  );
  
  SELECT 
  animals.name,
  AVG(animals.escape_attempts) AS avg_escape_attempts
FROM 
  animals
WHERE 
  animals.date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY 
  animals.name;
  
SELECT name AS pets_of_Melody FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name AS all_pokemons FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT owners.full_name AS owner, animals.name AS animals FROM owners LEFT JOIN animals ON owners.id = animals.owners_id;

SELECT species.name AS species, COUNT(animals.name) AS total_animals FROM species RIGHT JOIN animals ON species.id = animals.species_id GROUP BY species.name;

SELECT animals.name AS all_Jennifer_Digimons FROM animals JOIN species ON animals.species_id = species.id JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name AS all_no_ecape_animals_of_Dean FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name AS owner_with_most_animals, COUNT(animals.name) AS number_of_animals FROM owners RIGHT JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name ORDER BY number_of_animals DESC LIMIT 1;



SELECT animals.name AS last_animal_seen_by_William FROM animals INNER JOIN visits ON animals.id = visits.animals_id INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(*)  AS number_of_animals_seen_by_Stephanie_Mendez  FROM animals INNER JOIN visits ON animals.id = visits.animals_id INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez';

SELECT species.name, vets.name AS specialized_and_unspecialized_vets FROM species FULL JOIN specializations ON species.id =specializations.species_id FULL JOIN vets ON specializations.vet_id = vets.id;

SELECT animals.name AS name_of_animals_seen_by_Stephanie_Mendez,visits.date_of_visit  FROM animals INNER JOIN visits ON animals.id = visits.animals_id INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-1' AND '2020-08-30';

SELECT animals.name, COUNT(*) AS most_visit_count
FROM animals
JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY most_visit_count DESC
LIMIT 1;

SELECT animals.name AS first_animal_seen_by_Maisy_Smith,visits.date_of_visit FROM animals INNER JOIN visits ON animals.id = visits.animals_id INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT animals.name AS most_recent_visit,visits.*,vets.* FROM animals INNER JOIN visits ON animals.id = visits.animals_id INNER JOIN vets ON visits.vets_id = vets.id ORDER BY visits.date_of_visit DESC LIMIT 1;


SELECT COUNT(*) AS non_specialized_visits FROM visits JOIN animals ON visits.animals_id = animals.id JOIN vets ON visits.vets_id = vets.id LEFT JOIN specializations ON vets.id = specializations.vet_id AND animals.species_id = specializations.species_id WHERE specializations.species_id IS NULL;


SELECT species.name, COUNT(*) AS visits_count
FROM visits
LEFT JOIN animals ON animals.id = visits.animals_id
LEFT JOIN species ON animals.species_id = species.id
LEFT JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY visits_count DESC
LIMIT 1
