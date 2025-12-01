SELECT c.language, b.name FROM countrylanguage c JOIN country b ON c.countrycode=b.code WHERE isofficial=TRUE;
-- 1. Hər şəhərin adını və aid olduğu ölkəni göstər
SELECT cy.name AS city, c.name AS country
FROM city cy
JOIN country c ON cy.countrycode = c.code;


-- 2. Hər ölkənin rəsmi dillərini göstər
SELECT c.name AS country, cl.language
FROM country c
JOIN countrylanguage cl ON c.code = cl.countrycode
WHERE cl.isofficial = TRUE;


-- 3. Şəhərlərin əhalisi və ölkənin qitəsi birlikdə
SELECT cy.name AS city, cy.population, c.continent
FROM city cy
JOIN country c ON cy.countrycode = c.code;


-- 4. Əhalisi 1 milyon+ olan şəhərlərin ölkə adını göstər
SELECT cy.name AS city, cy.population, c.name AS country
FROM city cy
JOIN country c ON cy.countrycode = c.code
WHERE cy.population > 1000000;


-- 5. Hər ölkənin danışılan dilləri və həmin dilin faiz göstəricisi
SELECT c.name AS country, cl.language, cl.percentage
FROM country c
JOIN countrylanguage cl ON c.code = cl.countrycode;


-- 6. Qitələr üzrə ölkə və paytaxt şəhərinin adı
SELECT c.name AS country, cy.name AS capital_city, c.continent
FROM country c
JOIN city cy ON c.capital = cy.id;


-- 7. Hər ölkənin ümumi şəhər sayını JOIN+GROUP BY ilə tap
SELECT c.name AS country, COUNT(cy.id) AS city_count
FROM country c
LEFT JOIN city cy ON c.code = cy.countrycode
GROUP BY c.name;


-- 8. Rəsmi dili İspan dili olan ölkələrin şəhərləri
SELECT cy.name AS city, c.name AS country
FROM city cy
JOIN country c ON cy.countrycode = c.code
JOIN countrylanguage cl ON cl.countrycode = c.code
WHERE cl.language = 'Spanish' AND cl.isofficial = TRUE;


-- 9. Ölkə–paytaxt–qitə məlumatları (3 JOIN)
SELECT c.name AS country, cy.name AS capital_city, c.continent
FROM country c
JOIN city cy ON c.capital = cy.id;


-- 10. Hər dil üçün neçə ölkədə danışıldığını JOIN ilə göstər
SELECT cl.language, COUNT(c.code) AS country_count
FROM countrylanguage cl
JOIN country c ON cl.countrycode = c.code
GROUP BY cl.language;
