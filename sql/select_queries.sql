SELECT name, population FROM city ORDER BY population DESC LIMIT 10;

-- 1. Bütün şəhərlərin adını və əhalisini göstər
SELECT name, population
FROM city;


-- 2. Avropaya aid ölkələrin adlarını göstər
SELECT name
FROM country
WHERE continent = 'Europe';


-- 3. Əhalisi 5 milyondan çox olan ölkələri göstər
SELECT name, population
FROM country
WHERE population > 5000000;


-- 4. COUNTRYLANGUAGE cədvəlindən rəsmi dilləri göstər
SELECT countrycode, language
FROM countrylanguage
WHERE isofficial = TRUE;


-- 5. Niderland (NLD) ölkəsinin bütün şəhərlərini göstər
SELECT name, population
FROM city
WHERE countrycode = 'NLD';


-- 6. Əhalisi ən böyük 5 şəhəri göstər
SELECT name, population
FROM city
ORDER BY population DESC
LIMIT 5;


-- 7. Hər ölkənin neçə şəhəri olduğunu göstər
SELECT countrycode, COUNT(*)
FROM city
GROUP BY countrycode;


-- 8. Əlifba sırası ilə ölkə adlarını göstər
SELECT name
FROM country
ORDER BY name;


-- 9. Dünya üzrə orta ömür uzunluğunu tap
SELECT AVG(lifeexpectancy)
FROM country;


-- 10. Təkrarsız dilləri göstər
SELECT DISTINCT language
FROM countrylanguage;
