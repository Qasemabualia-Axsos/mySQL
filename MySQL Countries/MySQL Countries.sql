-- Question 1-- 
select countries.name, languages.language ,languages.percentage
from world.countries 
join world.languages
 on countries.id = languages.country_id
where languages.language= "slovene"
ORDER BY languages.percentage DESC;

-- Question 2-- 
SELECT countries.name, COUNT(cities.id) AS cities_total
FROM world.countries
JOIN world.cities
  ON countries.id = cities.country_id
GROUP BY countries.id, countries.name
ORDER BY cities_total DESC;


-- Question 3-- 
select cities.name,cities.population
from world.cities
join world.countries
 on countries.id = cities.country_id 
where countries.name = "mexico" and cities.population > "500000"
ORDER BY cities.population DESC;

-- Question 4-- 
select countries.name, languages.language, languages.percentage
from world.languages
join world.countries
 on countries.id = languages.country_id
where population > "89%"
order by languages.percentage DESC;

-- question5-- 
select countries.name,countries.surface_area,countries.population
from world.countries
where surface_area < "501" and population >  "100000";


-- question6-- 
select countries.name, countries.government_form ,countries.capital, countries.life_expectancy
from world.countries
where government_form = "Constitutional Monarchy" and capital > "200" and life_expectancy > "75";

-- question7-- 
select countries.name , cities.name, cities.district, cities.population
from world.cities
join world.countries
 on countries.id = cities.country_id
where countries.name = "Argentina" and district="Buenos Aires" and cities.population > "500000";

-- question 8:
select countries.region, count(countries.name) as total
from world.countries
group by countries.region
order by total DESC;












