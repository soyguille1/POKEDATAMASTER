CREATE DATABASE Pokemondata;

CREATE TABLE pokemon(
	id_pokemon INT IDENTITY(1,1)  PRIMARY KEY,
	nombre_pokemon VARCHAR(20) NOT NULL,
	categoria_pokemon VARCHAR(20) NOT NULL,
	habilidad_pokemon VARCHAR(20) NOT NULL,
	tipo_pokemon VARCHAR(20) NOT NULL,
	debilidad_pokemon VARCHAR(20) NOT NULL
	
);

CREATE TABLE entrenadores(
	id_entrenador INT IDENTITY(1,1) PRIMARY KEY,
	nombre_entrenador VARCHAR(20) NOT NULL,
	edad_entrenador VARCHAR(20) NOT NULL,
	ciudad_entrenador VARCHAR(20) NOT NULL
	
);

CREATE TABLE batallas (
    id_batalla INT IDENTITY(1,1) PRIMARY KEY,
    entrenador1_id INT,
    entrenador2_id INT,
    pokemon1_id INT,
    pokemon2_id INT,
    fecha DATE,
    resultado BIT,
    FOREIGN KEY (entrenador1_id) REFERENCES entrenadores(id_entrenador),
    FOREIGN KEY (entrenador2_id) REFERENCES entrenadores(id_entrenador),
    FOREIGN KEY (pokemon1_id) REFERENCES pokemon(id_pokemon),
    FOREIGN KEY (pokemon2_id) REFERENCES pokemon(id_pokemon)
);


INSERT INTO pokemon (nombre_pokemon,categoria_pokemon,habilidad_pokemon,tipo_pokemon,debilidad_pokemon)
VALUES ('Bulbasaur','Semilla','Espesura','planta','Fuego')
,('Charmander','Largatija','Mar llamas','Fuego','Agua')
,('Charizard','Llama','Mar llamas','Fuego','Agua');

INSERT INTO entrenadores(nombre_entrenador,edad_entrenador,ciudad_entrenador)
VALUES ('Gualberto',19,'Luque'),
('Pedro',25,'Lambare'),
('Jose',22,'Capiata');

INSERT INTO batallas(entrenador1_id,entrenador2_id,pokemon1_id,pokemon2_id,fecha,resultado)
VALUES (1,2,1,2,'2024-01-12',1);

SELECT nombre_pokemon,tipo_pokemon
FROM pokemon

UPDATE pokemon 
SET nombre_pokemon = 'Pikachu'
WHERE pokemon.nombre_pokemon = 'Charizard' ;

DELETE FROM batallas
WHERE pokemon1_id = 1 OR pokemon2_id = 1;

DELETE FROM pokemon
WHERE id_pokemon = 1;
