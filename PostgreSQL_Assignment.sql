-- Active: 1747909792912@@127.0.0.1@5432@conservation_db
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    region VARCHAR(30)
);
CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(30),
    scientific_name VARCHAR(40),
    discovery_date DATE,
    conservation_status VARCHAR(30)
);
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id int REFERENCES rangers(ranger_id),
    species_id  int REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    "location" VARCHAR(30),
    notes TEXT
);
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('David Patel', 'Southern Wetlands'),
('Emily Tran', 'Western Forest'),
('Frank Morales', 'Eastern Savannah'),
('Grace Lin', 'Northern Hills'),
('Henry Okoro', 'Central Valley'),
('Irene Zhang', 'River Delta'),
('Jake Thompson', 'Southern Wetlands'),
('Karen Singh', 'Mountain Range'),
('Liam O''Connor', 'River Delta'),
('Maria Gonzalez', 'Eastern Savannah'),
('Nathan Brown', 'Central Valley'),
('Olivia Kim', 'Western Forest'),
('Paul Dubois', 'Northern Hills'),
('Quinn Parker', 'Southern Wetlands'),
('Rosa Ahmed', 'River Delta'),
('Steve Black', 'Eastern Savannah'),
('Tina Nguyen', 'Mountain Range');


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Vulnerable'),
('Indian Cobra', 'Naja naja', '1792-01-01', 'Least Concern'),
('Indian Gaur', 'Bos gaurus', '1827-01-01', 'Vulnerable'),
('Malabar Civet', 'Viverra civettina', '1864-01-01', 'Critically Endangered'),
('Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
('Indian Leopard', 'Panthera pardus fusca', '1794-01-01', 'Vulnerable'),
('Great Indian Bustard', 'Ardeotis nigriceps', '1831-01-01', 'Critically Endangered'),
('Nilgiri Tahr', 'Nilgiritragus hylocrius', '1838-01-01', 'Endangered'),
('Indian Star Tortoise', 'Geochelone elegans', '1831-01-01', 'Vulnerable'),
('Golden Langur', 'Trachypithecus geei', '1953-01-01', 'Endangered'),
('Indian Rhinoceros', 'Rhinoceros unicornis', '1758-01-01', 'Vulnerable'),
('Hangul Deer', 'Cervus hanglu hanglu', '1844-01-01', 'Critically Endangered'),
('Indian Wolf', 'Canis lupus pallipes', '1832-01-01', 'Endangered'),
('Ganges River Dolphin', 'Platanista gangetica', '1801-01-01', 'Endangered'),
('Hoolock Gibbon', 'Hoolock hoolock', '1867-01-01', 'Endangered'),
('Indian Peafowl', 'Pavo cristatus', '1758-01-01', 'Least Concern');


INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL),
(4, 4, 'Wetland Edge', '2024-05-11 08:00:00', 'Family group crossing'),
(5, 5, 'Termite Trail', '2024-05-13 14:30:00', 'Foraging seen'),
(6, 6, 'Rock Cliffs', '2024-05-14 11:50:00', 'Basking'),
(7, 7, 'Salt Lick', '2024-05-19 07:15:00', NULL),
(8, 8, 'Deep Forest Trail', '2024-05-20 17:00:00', 'Brief sighting'),
(9, 9, 'River Crossing', '2024-05-20 06:45:00', 'Scratch marks found'),
(10, 10, 'Leopard Rock', '2024-05-21 18:10:00', 'Roaring sound heard'),
(11, 11, 'Dry Grass Plateau', '2024-05-21 09:00:00', 'Seen flying low'),
(12, 12, 'Cliffside Ledge', '2024-05-22 07:30:00', 'Pair grazing'),
(13, 13, 'Forest Floor', '2024-05-22 10:15:00', 'Sheltering under tree'),
(14, 14, 'Highland Grove', '2024-05-22 13:45:00', 'Climbing activity observed'),
(15, 15, 'Muddy Bank', '2024-05-23 11:25:00', 'Drinking from waterhole'),
(16, 16, 'Pine Slope', '2024-05-23 08:50:00', 'Antlers caught in branches'),
(17, 17, 'Rocky Path', '2024-05-23 17:35:00', 'Howling heard at dusk'),
(18, 18, 'River Bend', '2024-05-24 06:15:00', 'Breaching out of water'),
(19, 19, 'Canopy Zone', '2024-05-24 14:00:00', 'Swinging between trees');


--Problem 1
INSERT INTO rangers(name,region)VALUES('Derek Fox','Coastal Plains');
--Problem 2
SELECT count(*) from(
    SELECT  count(*) from sightings
GROUP BY species_id);

--Problem 3
SELECT * FROM sightings
WHERE "location" ILIKE '%pass%';

--Problem 4
SELECT name,count(sighting_id) as total_sightings from rangers
JOIN sightings USING(ranger_id)
GROUP BY ranger_id;

--Problem 5 not working

select common_name from species 
WHERE species_id NOT IN 
(select species_id from sightings);

--problem 6
select s.common_name,sighting_time,"name" from sightings si
JOIN rangers r USING (ranger_id)
JOIN species s USING(species_id)
ORDER BY sighting_time DESC limit 2;

--Problem 7
UPDATE species
set conservation_status='Historic'
WHERE(EXTRACT(YEAR FROM discovery_date) <1800);

--Problem 8
--Problem 9
DELETE FROM rangers
WHERE ranger_id IN( 
    SELECT ranger_id FROM rangers
LEFT JOIN sightings using(ranger_id)
WHERE sighting_id IS NULL);



select * from species;
select * from rangers;
select * from sightings;
