WITH RECURSIVE all_ways AS (
     SELECT point1 AS first, 
            point2 AS second,
            cost   AS total_cost,
            2      AS total_count
       FROM node
      WHERE point1 = 'a'
     UNION 
     SELECT CONCAT(first, ',', second), 
            point2,
            total_cost + cost,
            total_count + 1
       FROM all_ways
            JOIN node ON second = point1 AND POSITION(point1 IN first) = 0 ),
 tour_a AS (
   SELECT total_cost, CONCAT('{', first, ',', second, '}') AS tour
     FROM all_ways
    WHERE second = 'a' AND total_count = 5 )

  SELECT total_cost, tour
    FROM tour_a
   WHERE total_cost = (SELECT MIN(total_cost) FROM tour_a) OR total_cost = (SELECT MAX(total_cost) FROM tour_a)
ORDER BY 1, 2