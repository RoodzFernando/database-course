SELECT basis

1. The example uses a WHERE clause to show the population of 'France'.  Note that strings (pieces of text that are data) should be in 'single quotes';
Modify it to show the population of Germany

Answer: SELECT population FROM world
        WHERE name = 'Germany'

2. Checking a list The word IN allows us to check if an item is in a list.  The example shows the name AND population for the countries 'Brazil', 'Russia', 'India' AND 'China'. 
Show the name AND the population for 'Sweden', 'Norway' AND 'Denmark'. 

Answer: SELECT name, population FROM world 
        WHERE name IN ('Sweden', 'Norway', 'Denmark')

3. Which countries are not too small AND not too big? BETWEEN allows range checking (range specified is inclusive of boundary values).  The example below shows countries with an area of 250,000-300,000 sq.  km.  Modify it to show the country AND the area for countries with an area between 200,000 AND 250,000. 

Answer: SELECT name, area FROM world 
        WHERE area BETWEEN 200000 AND 250000

SELECT FROM WORLD Tutorial

1. Read the notes about this table.  Observe the result of running this SQL commAND to show the name, continent AND population of all countries. 

Answer: SELECT name, continent, population FROM world

2. How to use WHERE to filter records.  Show the name for the countries that have a population of at least 200 million.  200 million is 200000000, there are eight zeros. 

Answer: SELECT name FROM world
        WHERE population >= 200000000

3. Give the name AND the per capita GDP for those countries with a population of at least 200 million. 

Answer: SELECT name, gdp/population FROM world 
        WHERE population >= 200000000

4. Show the name AND population in millions for the countries of the continent 'South America'.  Divide the population by 1000000 to get population in millions. 

Answer: SELECT name, population/1000000 AS pop_milion FROM world 
        WHERE continent = 'South America'

5. Show the name AND population for France, Germany, Italy

Answer: SELECT name, population FROM world
        WHERE name IN('France', 'Germany', 'Italy')

6. Show the countries which have a name that includes the word 'United'

Answer: SELECT name FROM world 
        WHERE name LIKE '%United%'

7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. 
Show the countries that are big by area or big by population.  Show name, population AND area. 

Answer: SELECT name, population, area FROM world 
        WHERE area > 3000000 OR population > 250000000

8. Exclusive OR (XOR).  Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both.  Show name, population AND area. 
Australia has a big area but a small population, it should be included. 
Indonesia has a big population but a small area, it should be included. 
China has a big population AND big area, it should be excluded. 
United Kingdom has a small population AND a small area, it should be excluded. 

Answer: SELECT name,population, area FROM world
        WHERE (area > 3000000) XOR (population > 250000000)

9. Show the name AND population in millions AND the GDP in billions for the countries of the continent 'South America'.  Use the ROUND function to show the values to two decimal places. 
For South America show population in millions AND GDP in billions both to 2 decimal places. 

Answer: SELECT name, ROUND(population/1000000,2) AS pop_milion, ROUND(gdp/1000000000,2) AS gdp_bilion FROM world
        WHERE continent = 'South America'

10. Show the name AND per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros).  Round this value to the nearest 1000. 
Show per-capita GDP for the trillion dollar countries to the nearest $1000. 

Answer: SELECT name, ROUND(gdp/population,-3) FROM world
        WHERE gdp >= 1000000000000

11. Greece has capital Athens. 
Each of the strings 'Greece', AND 'Athens' has 6 characters. 
Show the name AND capital WHERE the name AND the capital have the same number of characters. 

Answer: SELECT name, capital FROM world
        WHERE LENGTH(name) = LENGTH(capital)

12. The capital of Sweden is Stockholm.  Both words start with the letter 'S'. 
Show the name AND the capital WHERE the first letters of each match.  Don't include countries WHERE the name AND the capital are the same word. '

Answer: SELECT name, capital FROM world 
        WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

13. Equatorial Guinea AND Dominican Republic have all of the vowels (a e i o u) in the name.  They don't count because they have more than one word in the name. 
Find the country that has all the vowels AND no spaces in its name. '

Answer: SELECT name
FROM world
WHERE name LIKE '%u%' 
  AND name LIKE '%a%' 
  AND name LIKE '%o%' 
  AND name LIKE '%i%'
  AND name LIKE '%e%'
  AND name NOT LIKE '% %'

SELECT FROM Nobel Tutorial

1. Change the query shown so that it displays Nobel prizes for 1950. 

Answer: SELECT yr, subject, winner FROM nobel
        WHERE yr = 1950

2. Show who won the 1962 prize for Literature. 

Answer: SELECT winner FROM nobel
        WHERE yr = 1962 AND subject = 'Literature'

3. Show the year AND subject that won 'Albert Einstein' his prize. 

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

8. Show the year, subject, AND name of Physics winners for 1980 together with the Chemistry winners for 1984. 

Answer: SELECT yr, subject, winner FROM nobel
        WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984)

9. Show the year, subject, AND name of winners for 1980 excluding Chemistry AND Medicine

Answer: SELECT yr, subject, winner FROM nobel
        WHERE yr = 1980 AND subject <> 'Chemistry' AND subject <> 'Medicine'

10. Show year, subject, AND name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

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
List the winners, year AND subject WHERE the winner starts with Sir. Show the the most recent first, then by name order.

Answer: SELECT winner, yr, subject FROM nobel
        WHERE winner LIKE 'Sir%'
        ORDER BY yr DESC

14. The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
Show the 1984 winners AND subject ordered by subject AND winner name; but list Chemistry AND Physics last.

Answer: SELECT winner, subject FROM nobel
        WHERE yr=1984
        ORDER BY subject IN('Chemistry', 'Physics'),subject, winner

SELECT within SELECT Tutorial

1. List each country name WHERE the population is larger than that of 'Russia'.
world(name, continent, area, population, gdp)

Answer: SELECT name FROM world
        WHERE population > (SELECT population FROM world WHERE name='Russia')

2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

Answer: SELECT name FROM world
        WHERE continent = 'Europe' AND gdp/population >(SELECT gdp/population FROM world
                                                        WHERE name = 'United Kingdom')

3. List the name AND continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

Answer: SELECT name, continent FROM world
        WHERE continent=(SELECT continent FROM world WHERE name = 'Argentina') 
        OR continent=(SELECT continent FROM world WHERE name = 'Australia') ORDER BY name

4. Which country has a population that is more than Canada but less than PolAND? Show the name AND the population.

Answer: SELECT name, population FROM world 
        WHERE population < (SELECT population FROM world WHERE name = 'PolAND') 
        AND population > (SELECT population FROM world WHERE name = 'Canada')

5. Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
Show the name AND the population of each country in Europe. Show the population as a percentage of the population of Germany.

Answer: SELECT name, CONCAT(ROUND(population*100/(SELECT population FROM world WHERE name = 'Germany')),'%') FROM world 
        WHERE continent = 'Europe'

6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

Answer: SELECT name FROM world 
        WHERE gdp > ALL(SELECT gdp FROM world
                        WHERE continent = 'Europe' AND gdp > 0)

7. Find the largest country (by area) in each continent, show the continent, the name AND the area:

Answer: SELECT continent, name, area FROM world x
        WHERE area >= ALL(SELECT area FROM world y
                          WHERE y.continent=x.continent AND population>0)

8. List each continent AND the name of the country that comes first alphabetically.

Answer: SELECT continent, MIN(name) AS name FROM world 
        GROUP BY continent ORDER by continent
        

9. Find the continents WHERE all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent AND population.

Answer: SELECT name, continent, population FROM world w
        WHERE NOT EXISTS (SELECT * FROM world nx
                          WHERE nx.continent = w.continent AND nx.population > 25000000)

10. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries AND continents.

Answer: SELECT name, continent FROM world AS big_name
        WHERE population = (SELECT MAX(population) FROM world AS big_pop
                            WHERE big_name.continent = big_pop.continent
                            GROUP BY continent) 
        AND population > (SELECT MAX(population)*3 FROM world AS world1
                          WHERE big_name.continent = world1.continent AND population != (SELECT MAX(population) FROM world AS world2
      WHERE world1.continent = world2.continent GROUP BY continent)
      GROUP BY continent)

SUM AND COUNT Tutorial

1. Show the total population of the world.
world(name, continent, area, population, gdp)

Answer: SELECT SUM(population) FROM world

2. List all the continents - just once each.

Answer: SELECT DISTINCT continent FROM world

3. Give the total GDP of Africa

Answer: SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

4. How many countries have an area of at least 1000000

Answer: SELECT COUNT(name) FROM world WHERE area > 1000000

5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')

Answer: SELECT SUM(population) FROM world 
        WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

6. For each continent show the continent AND number of countries.

Answer: SELECT continent, COUNT(name) FROM world
        GROUP BY continent

7. For each continent show the continent AND number of countries with populations of at least 10 million.

Answer: SELECT continent, COUNT(name) FROM world
        WHERE population >= 10000000 GROUP BY continent 

8. List the continents that have a total population of at least 100 million.

Answer: SELECT continent FROM world
        GROUP BY continent
        HAVING SUM(population) >= 100000000

The JOIN operation

1. The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
Modify it to show the matchid AND player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

Answer: SELECT matchid, player FROM goal 
        WHERE teamid = 'GER'

2. FROM the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.
Show id, stadium, team1, team2 for just game 1012.'

Answer: SELECT id,stadium,team1,team2 FROM game 
        WHERE id = 1012

3.
You can combine the two steps into a single query with a JOIN.

SELECT * FROM game JOIN goal ON (id=matchid)
The FROM clause says to merge data FROM the goal table with that FROM the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid FROM goal must match id FROM game. (If we wanted to be more clear/specific we could say
ON (game.id=goal.matchid)

The code below shows the player (FROM the goal) AND stadium name (FROM the game table) for every goal scored.
Modify it to show the player, teamid, stadium AND mdate for every German goal.

Answer: SELECT player,teamid, stadium, mdate FROM game 
        JOIN goal ON (id=matchid)
        WHERE teamid = 'GER'

4. Use the same JOIN as in the previous question.
Show the team1, team2 AND player for every goal scored by a player called Mario player LIKE 'Mario%'

Answer: SELECT team1,team2, player FROM game
        JOIN goal ON (id=matchid)
        WHERE player LIKE 'Mario%'

5. The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id
Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

Answer: SELECT player, teamid, coach, gtime FROM goal 
        JOIN eteam ON (id = teamid) WHERE gtime<=10

6. To JOIN game with eteam you could use either
game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)
Notice that because id is a column name in both game AND eteam you must specify eteam.id instead of just id
List the the dates of the matches AND the name of the team in which 'FernANDo Santos' was the team1 coach.

Answer: SELECT mdate, teamname FROM game 
        JOIN eteam ON (team1 = eteam.id)
        WHERE coach = 'FernANDo Santos'

7. List the player for every goal scored in a game WHERE the stadium was 'National Stadium, Warsaw'

Answer: SELECT player FROM goal
        JOIN game ON (id = matchid)
        WHERE stadium = 'National Stadium, Warsaw'

8. The example query shows all goals scored in the Germany-Greece quarterfinal.
Instead show the name of all players who scored a goal against Germany.

Answer: SELECT DISTINCT player FROM game
        JOIN goal ON matchid = id 
        WHERE (team1 ='GER' OR team2 = 'GER') AND (teamid != 'GER')

9. Show teamname AND the total number of goals scored.

Answer: SELECT teamname, COUNT(teamid) FROM goal 
        JOIN eteam ON id=teamid 
        GROUP BY teamname

10. Show the stadium AND the number of goals scored in each stadium.

Answer: SELECT stadium, COUNT(teamid) FROM game
        JOIN goal ON (id = matchid)
        GROUP BY stadium

11. For every match involving 'POL', show the matchid, date AND the number of goals scored.

Answer: SELECT matchid, mdate, COUNT(teamid) FROM game
        JOIN goal ON matchid = id 
        WHERE (team1 = 'POL' OR team2 = 'POL')
        GROUP BY matchid,mdate

12. For every match WHERE 'GER' scored, show matchid, match date AND the number of goals scored by 'GER'

Answer: SELECT matchid, mdate, COUNT(teamid) FROM game
        JOIN goal ON (id = matchid)
        WHERE teamid = 'GER' GROUP BY matchid, mdate

13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
mdate	team1	score1	team2	score2
Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 AND team2.

Answer: SELECT DISTINCT mdate, team1,
        SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
        FROM game JOIN goal ON matchid = id
        GROUP BY mdate,team1,team2
        ORDER BY mdate,matchid,team1,team2

More JOIN operations

1. List the films WHERE the yr is 1962 [Show id, title]

Answer: SELECT id, title FROM movie
        WHERE yr = 1962

2. Give year of 'Citizen Kane'.

Answer: SELECT yr FROM movie
        WHERE title = 'Citizen Kane'

3. List all of the Star Trek movies, include the id, title AND yr (all of these movies include the words Star Trek in the title). Order results by year.

Answer: SELECT id, title, yr FROM movie
        WHERE title LIKE 'Star Trek%' 
        ORDER BY yr

4. What id number does the actor 'Glenn Close' have?

Answer: SELECT id FROM actor
        WHERE name = 'Glenn Close'

5. What is the id of the film 'Casablanca'

Answer: SELECT id FROM movie
        WHERE title = 'Casablanca'

6. Obtain the cast list for 'Casablanca'.
what is a cast list?
Use movieid=11768, (or whatever value you got FROM the previous question)

Answer: SELECT name FROM actor
        JOIN casting ON (id = actorid)
        WHERE movieid = 11768

7. Obtain the cast list for the film 'Alien'

Answer: SELECT name FROM actor
        JOIN casting ON (actor.id = actorid)
        JOIN movie ON (movie.id = movieid)
        WHERE title = 'Alien'

8. List the films in which 'Harrison Ford' has appeared

Answer: SELECT title FROM casting 
        JOIN movie ON (id = movieid)
        WHERE actorid = 2216

9. List the films WHERE 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

Answer: SELECT title FROM casting 
        JOIN movie ON (id = movieid)
        WHERE actorid = 2216 AND ord <> 1

10. List the films together with the leading star for all 1962 films.

Answer: SELECT title, name FROM movie
        JOIN casting ON (movie.id = movieid)
        JOIN actor ON (actor.id = actorid)
        WHERE yr = 1962 AND ord = 1

11. Which were the busiest years for 'Rock Hudson', show the year AND the number of movies he made each year for any year in which he made more than 2 movies.

Answer: SELECT yr,COUNT(title) FROM movie
        JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
        WHERE name='Rock Hudson'
        GROUP BY yr
        HAVING COUNT(title) > 2

12. List the film title AND the leading actor for all of the films 'Julie ANDrews' played in.

Answer: SELECT title, name FROM movie
        JOIN casting ON (movieid = movie.id AND ord = 1)
        JOIN actor ON (actor.id = actorid)
        WHERE movie.id IN (
        SELECT movieid FROM casting
        WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie ANDrews'))

13. Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.'

Answer: SELECT name FROM actor
        JOIN casting ON (actor.id = actorid)
        WHERE  ord=1 GROUP BY name
        HAVING COUNT(movieid)>=30

14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

Answer: SELECT movie.title,COUNT(casting.actorid) FROM movie 
        INNER JOIN casting ON movie.id=casting.movieid 
        INNER JOIN actor ON casting.actorid=actor.id
        WHERE yr=1978
        group by title
        ORDER BY COUNT(actorid) DESC, title

15. List all the people who have worked with 'Art Garfunkel'.

Answer: SELECT actor.name FROM actor 
        INNER JOIN casting ON actor.id=casting.actorid
        INNER JOIN movie ON casting.movieid=movie.id
        WHERE casting.movieid IN 
        (SELECT movie.id FROM movie
        INNER JOIN casting ON casting.movieid=movie.id
        INNER JOIN actor ON actor.id=casting.actorid
        WHERE actor.name='Art Garfunkel')
        AND actor.name<>'Art Garfunkel'


Using Null

1. List the teachers who have NULL for their department.

Answer: SELECT name FROM teacher
        WHERE dept <=> NULL

2. Note the INNER JOIN misses the teachers with no department AND the departments with no teacher.

Answer: SELECT teacher.name, dept.name FROM teacher 
        INNER JOIN dept ON (teacher.dept=dept.id)

3. Use a different JOIN so that all teachers are listed.

Answer: SELECT teacher.name, dept.name FROM teacher 
        LEFT JOIN dept ON (teacher.dept = dept.id)

4. Use a different JOIN so that all departments are listed.

Answer: SELECT teacher.name, dept.name FROM teacher 
        RIGHT JOIN dept ON (teacher.dept = dept.id)

5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name AND mobile number or '07986 444 2266'

Answer: SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

6. Use the COALESCE function AND a LEFT JOIN to print the teacher name AND department name. Use the string 'None' WHERE there is no department.

Answer: SELECT teacher.name, COALESCE(dept.name,'None') FROM teacher
        LEFT JOIN dept ON (teacher.dept = dept.id)

7. Use COUNT to show the number of teachers AND the number of mobile phones.

Answer: SELECT COUNT(teacher.id), COUNT(mobile) FROM teacher

8. Use COUNT AND GROUP BY dept.name to show each department AND the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.

Answer: SELECT dept.name, COUNT(teacher.id) FROM teacher
        RIGHT JOIN dept ON (teacher.dept = dept.id)
        GROUP BY dept.name

9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 AND 'Art' otherwise.

Answer: SELECT name, 
        CASE WHEN dept IN ('1','2') THEN 'Sci'
        ELSE 'Art' END FROM teacher

10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 AND 'None' otherwise.'

Answer: SELECT name, CASE WHEN dept IN ('1','2') THEN 'Sci'
        WHEN dept = '3' THEN 'Art'
        ELSE 'None' END
        FROM teacher


Self join

1. How many stops are in the database.

Answer: SELECT COUNT(*) FROM stops

2. Find the id value for the stop 'Craiglockhart'

Answer: SELECT id FROM stops 
        WHERE name = 'Craiglockhart'

3. Give the id AND the name for the stops on the '4' 'LRT' service.

Answer: SELECT id, name FROM stops
        JOIN route ON (id = stop)
        WHERE num = '4' AND company = 'LRT'

4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query AND notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.

Answer: SELECT company, num, COUNT(*) FROM route 
        WHERE stop=149 OR stop=53
        GROUP BY company, num HAVING COUNT(*) > 1

5. Execute the self join shown AND observe that b.stop gives all the places you can get to FROM Craiglockhart, without changing routes. Change the query so that it shows the services FROM Craiglockhart to London Road.

Answer: SELECT a.company, a.num, a.stop, b.stop FROM route a 
        JOIN route b ON (a.company=b.company AND a.num=b.num)
        WHERE a.stop=53 AND b.stop=149

6. The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' AND 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'

Answer: SELECT a.company, a.num, stopa.name, stopb.name FROM route a
        JOIN route b ON (a.company=b.company AND a.num=b.num)
        JOIN stops stopa ON (a.stop=stopa.id)
        JOIN stops stopb ON (b.stop=stopb.id)
        WHERE stopa.name = 'Craiglockhart' AND stopb.name='London Road'

7. Give a list of all the services which connect stops 115 AND 137 ('Haymarket' AND 'Leith')

Answer: SELECT a.company, a.num FROM route a 
        JOIN route b ON (a.company=b.company AND a.num=b.num)
        JOIN stops stopa ON (a.stop=stopa.id)
        JOIN stops stopb ON (b.stop=stopb.id)
        WHERE stopa.name='Haymarket' AND stopb.name='Leith'
        GROUP BY a.company, a.num

8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'

Answer: SELECT a.company, a.num FROM route a 
        JOIN route b ON (a.company=b.company AND a.num=b.num)
        JOIN stops stopa ON (a.stop=stopa.id)
        JOIN stops stopb ON (b.stop=stopb.id)
        WHERE stopa.name='Craiglockhart' and stopb.name='Tollcross'
        GROUP BY a.company, a.num

9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.

Answer: SELECT stops.name,a.company,a.num FROM route a 
JOIN stops ON stops.id=a.stop
JOIN route b ON a.company=b.company AND a.num=b.num
WHERE b.stop =(SELECT id FROM stops WHERE name= 'Craiglockhart')
AND a.company='LRT'

10. Find the routes involving two buses that can go from Craiglockhart to Lochend.
Show the bus no. and company for the first bus, the name of the stop for the transfer,
and the bus no. and company for the second bus.

Answer: SELECT a.num, a.company, stops.name, c.num, c.company FROM route a 
JOIN route b ON a.company=b.company AND a.num=b.num
JOIN stops ON stops.id=a.stop
JOIN route c ON stops.id=c.stop
JOIN route d ON c.company=d.company AND c.num=d.num
WHERE b.stop =(SELECT id FROM stops WHERE name= 'Craiglockhart')
AND d.stop =(SELECT id FROM stops WHERE name= 'Lochend')
