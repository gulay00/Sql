SELECT name, population FROM country WHERE continent='Europe';
-- 1. Əhalisi 1 milyondan çox olan şəhərləri göstər
SELECT name, population
FROM city
WHERE population > 1000000;


-- 2. Avropada yerləşməyən ölkələri göstər
SELECT name, continent
FROM country
WHERE continent <> 'Europe';


-- 3. Səhiyyə xərci məlumatı NULL olan ölkələri tap
SELECT name, governmentform
FROM country
WHERE lifeexpectancy IS NULL;


-- 4. Əhalisi 50,000 ilə 200,000 arasında olan şəhərləri göstər
SELECT name, population
FROM city
WHERE population BETWEEN 50000 AND 200000;


-- 5. Paytaxtı olan ölkələri göstər (capital is not null)
SELECT n
