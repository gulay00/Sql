SELECT * FROM (SELECT code,name,population, ROW_NUMBER() OVER (PARTITION BY code ORDER BY population DESC) rn FROM country) t WHERE rn<=3;
---------------------------------------------------------------
-- 1. Ölkələri əhalisinə görə sıralayan ROW_NUMBER()
---------------------------------------------------------------
SELECT 
    name AS country,
    population,
    ROW_NUMBER() OVER (ORDER BY population DESC) AS rn
FROM country;


---------------------------------------------------------------
-- 2. Qitələr üzrə ölkələri əhalisinə görə sıralayan PARTITION + ROW_NUMBER()
---------------------------------------------------------------
SELECT
    continent,
    name AS country,
    population,
    ROW_NUMBER() OVER (PARTITION BY continent ORDER BY population DESC) AS rn
FROM country;


---------------------------------------------------------------
-- 3. Ən böyük 3 ölkəni ROW_NUMBER() ilə tap (subquery ilə)
---------------------------------------------------------------
SELECT *
FROM (
    SELECT 
        name,
        population,
        ROW_NUMBER() OVER (ORDER BY population DESC) AS rn
    FROM country
) t
WHERE rn <= 3;


---------------------------------------------------------------
-- 4. Şəhərləri əhalisinə görə sıralayan RANK()
---------------------------------------------------------------
SELECT
    name AS city,
    population,
    RANK() OVER (ORDER BY population DESC) AS rnk
FROM city;


---------------------------------------------------------------
-- 5. Eyni əhalisi olan şəhərlərə eyni rank verən DENSE_RANK()
---------------------------------------------------------------
SELECT
    name AS city,
    population,
    DENSE_RANK() OVER (ORDER BY population DESC) AS dense_rnk
FROM city;


---------------------------------------------------------------
-- 6. Ölkə üzrə şəhərləri əhali sırası ilə siyahılayan PARTITION + RANK()
---------------------------------------------------------------
SELECT
    countrycode,
    name AS city,
    population,
    RANK() OVER (PARTITION BY countrycode ORDER BY population DESC) AS city_rank
FROM city;


---------------------------------------------------------------
-- 7. Hər qitənin ümumi əhalisini WINDOW SUM() ilə hesabla
---------------------------------------------------------------
SELECT
    name AS country,
    continent,
    population,
    SUM(population) OVER (PARTITION BY continent) AS continent_total_population
FROM country;


---------------------------------------------------------------
-- 8. Hər qitədə minimum ömür uzunluğunu MAX() window ilə göstər
---------------------------------------------------------------
SELECT
    name AS country,
    continent,
    lifeexpectancy,
    MAX(lifeexpectancy) OVER (PARTITION BY continent) AS max_life_in_continent
FROM country;


---------------------------------------------------------------
-- 9. Şəhərlərin ölkə üzrə ortalama əhali ilə müqayisəsi (AVG window)
---------------------------------------------------------------
SELECT
    name AS city,
    countrycode,
    population,
    AVG(population) OVER (PARTITION BY countrycode) AS avg_city_pop_country
FROM city;


---------------------------------------------------------------
-- 10. Ölkələri əhalisinə görə əvvəlki ölkənin əhalisi ilə müqayisə (LAG)
---------------------------------------------------------------
SELECT
    name AS country,
    population,
    LAG(population) OVER (ORDER BY population DESC) AS previous_country_pop
FROM country;
