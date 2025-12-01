SELECT countrycode, COUNT(language) c FROM countrylanguage GROUP BY countrycode ORDER BY c DESC LIMIT 5;
-- 1. Hər ölkədə neçə şəhər olduğunu göstər
SELECT countrycode, COUNT(*) AS city_count
FROM city
GROUP BY countrycode;


-- 2. Hər qitənin ümumi əhalisini göstər
SELECT continent, SUM(population) AS total_population
FROM country
GROUP BY continent;


-- 3. Hər ölkədə neçə rəsmi dil olduğunu tap
SELECT countrycode, COUNT(language) AS language_count
FROM countrylanguage
WHERE isofficial = TRUE
GROUP BY countrycode;


-- 4. Hər qitədə orta ömür uzunluğunu göstər
SELECT continent, AVG(lifeexpectancy) AS avg_life
FROM country
GROUP BY continent;


-- 5. Hər ölkədə şəhərlərin orta əhalisini göstər
SELECT countrycode, AVG(population) AS avg_city_population
FROM city
GROUP BY countrycode;


-- 6. Hər qitədə ölkə sayını göstər
SELECT continent, COUNT(*) AS country_count
FROM country
GROUP BY contine
