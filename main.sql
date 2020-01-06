SELECT basis

1. The example uses a WHERE clause to show the population of 'France'.  Note that strings (pieces of text that are data) should be in 'single quotes';
Modify it to show the population of Germany

Answer: SELECT population FROM world
        WHERE name = 'Germany'

2. Checking a list The word IN allows us to check if an item is in a list.  The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'. 
Show the name and the population for 'Sweden', 'Norway' and 'Denmark'. 

Answer: SELECT name, population FROM world 
        WHERE name IN ('Sweden', 'Norway', 'Denmark')

3. Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values).  The example below shows countries with an area of 250,000-300,000 sq.  km.  Modify it to show the country and the area for countries with an area between 200,000 and 250,000. 

Answer: SELECT name, area FROM world 
        WHERE area BETWEEN 200000 AND 250000

SELECT from WORLD Tutorial

1. Read the notes about this table.  Observe the result of running this SQL command to show the name, continent and population of all countries. 

Answer: SELECT name, continent, population FROM world

2. How to use WHERE to filter records.  Show the name for the countries that have a population of at least 200 million.  200 million is 200000000, there are eight zeros. 

Answer: SELECT name FROM world
        WHERE population >= 200000000

3. Give the name and the per capita GDP for those countries with a population of at least 200 million. 

Answer: SELECT name, gdp/population FROM world 
        WHERE population >= 200000000

4. Show the name and population in millions for the countries of the continent 'South America'.  Divide the population by 1000000 to get population in millions. 

Answer: SELECT name, population/1000000 AS pop_milion FROM world 
        WHERE continent = 'South America'

5. Show the name and population for France, Germany, Italy

Answer: SELECT name, population FROM world
        WHERE name IN('France', 'Germany', 'Italy')

6. Show the countries which have a name that includes the word 'United'

Answer: SELECT name FROM world 
        WHERE NAME LIKE '%United%'

7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. 
Show the countries that are big by area or big by population.  Show name, population and area. 

Answer: SELECT name, population, area FROM world 
        WHERE area > 3000000 OR population > 250000000

8. Exclusive OR (XOR).  Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both.  Show name, population and area. 
Australia has a big area but a small population, it should be included. 
Indonesia has a big population but a small area, it should be included. 
China has a big population and big area, it should be excluded. 
United Kingdom has a small population and a small area, it should be excluded. 

Answer: SELECT name,population, area FROM world
        WHERE (area > 3000000) XOR (population > 250000000)

9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.  Use the ROUND function to show the values to two decimal places. 
For South America show population in millions and GDP in billions both to 2 decimal places. 

Answer: SELECT name, ROUND(population/1000000,2) AS pop_milion, ROUND(gdp/1000000000,2) AS gdp_bilion FROM world
        WHERE continent = 'South America'

10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros).  Round this value to the nearest 1000. 
Show per-capita GDP for the trillion dollar countries to the nearest $1000. 

Answer: SELECT name, ROUND(gdp/population,-3) FROM world
        WHERE gdp >= 1000000000000

11. Greece has capital Athens. 
Each of the strings 'Greece', and 'Athens' has 6 characters. 
Show the name and capital where the name and the capital have the same number of characters. 

Answer: SELECT name, capital FROM world
        WHERE LENGTH(name) = LENGTH(capital)

12. The capital of Sweden is Stockholm.  Both words start with the letter 'S'. 
Show the name and the capital where the first letters of each match.  Don't include countries where the name and the capital are the same word. '

Answer: SELECT name, capital FROM world 
        WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

13. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name.  They don't count because they have more than one word in the name. 
Find the country that has all the vowels and no spaces in its name. '

Answer: SELECT name
FROM world
WHERE name LIKE '%u%' 
  and name LIKE '%a%' 
  and name LIKE '%o%' 
  and name LIKE '%i%'
  and name LIKE '%e%'
  and name NOT LIKE '% %'

SELECT from Nobel Tutorial

1. Change the query shown so that it displays Nobel prizes for 1950. 

Answer: SELECT yr, subject, winner FROM nobel
        WHERE yr = 1950

2. Show who won the 1962 prize for Literature. 

Answer: SELECT winner FROM nobel
        WHERE yr = 1962 AND subject = 'Literature'

3. Show the year and subject that won 'Albert Einstein' his prize. 

Answer: SELECT yr, subject FROM nobel
        WHERE winner = 'Albert Einstein'

4. Give the name of the 'Peace' winners since the year 2000, including 2000. 

Answer: SELECT winner FROM nobel
        WHERE subject = 'Peace' AND yr >= 2000

5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. 

Answer: SELECT yr, subject, winner FROM nobel
        WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

6. Show all details of the presidential winners:
- Theodore Roosevelt
- Woodrow Wilson
- Jimmy Carter
- Barack Obama

Answer: SELECT * FROM nobel
        WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

7. Show the winners with first name John

Answer: SELECT winner FROM nobel
        WHERE LEFT(winner,4) = 'John'

8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984. 

Answer: SELECT yr, subject, winner FROM nobel
        WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984)

9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

Answer: SELECT yr, subject, winner FROM nobel
        WHERE yr = 1980 AND subject <> 'Chemistry' AND subject <> 'Medicine'

10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

Answer: SELECT yr, subject, winner FROM nobel
        WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004

11. Find all details of the prize won by PETER GRÜNBERG

Answer: SELECT * FROM nobel
        WHERE winner = 'PETER GRÜNBERG'

12. Find all details of the prize won by EUGENE O'NEILL.'

Answer: SELECT * FROM nobel
WHERE winner = 'EUGENE O\'NEILL'
'
13. Knights in order
List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

Answer: SELECT winner, yr, subject FROM nobel
        WHERE winner LIKE 'Sir%'
        ORDER BY yr DESC

14. The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

Answer: SELECT winner, subject FROM nobel
        WHERE yr=1984
        ORDER BY subject IN('Chemistry', 'Physics'),subject, winner