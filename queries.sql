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