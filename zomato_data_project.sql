
-- giving the dataset more structure and eliminatinating non useful columns



CREATE TABLE zomato_restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    city VARCHAR(100),
    cuisines VARCHAR(255),
    average_cost_for_two INT,
    currency VARCHAR(50),
    has_table_booking VARCHAR(3), 
    has_online_delivery VARCHAR(3), 
    aggregate_rating DECIMAL(3,2),
    rating_color VARCHAR(50),
    rating_text VARCHAR(50),
    votes INT
);

-- finding top 10 cuisines what's selling 

SELECT COUNT(*) AS total_restaurants, cuisines 
FROM zomato_restaurants
GROUP BY cuisines 
ORDER BY total_restaurants DESC 
LIMIT 10 ;

-- overall distribution 

SELECT rating_text, 
      COUNT(*) AS restaurant_count,
	  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM zomato_restaurants), 2) AS percentage
      FROM zomato_restaurants 
      Group by rating_text 
      order by restaurant_count DESC;
      
-- finding top cities based on rating 

SELECT 
    city,
    ROUND(AVG(aggregate_rating), 2) AS avg_city_rating,
    COUNT(*) AS total_restaurants
FROM zomato_restaurants
GROUP BY city
HAVING COUNT(*) > 10
ORDER BY avg_city_rating DESC
LIMIT 5;

-- impact of online orders 

SELECT 
    has_online_delivery,
    COUNT(restaurant_id) AS total_restaurants,
    ROUND(AVG(aggregate_rating), 2) AS average_rating,
    ROUND(AVG(votes), 0) AS average_votes
FROM zomato_restaurants
GROUP BY has_online_delivery;

-- top 10 most expesive restaurant

SELECT 
    restaurant_name,
    city,
    cuisines,
    average_cost_for_two,
    aggregate_rating
FROM zomato_restaurants
ORDER BY average_cost_for_two DESC
LIMIT 10;

-- ranking top restaurant rating based on cities

SELECT 
    city,
    MAX(aggregate_rating) AS highest_rating
FROM zomato_restaurants
GROUP BY city;

-- grouping based on cost level


SELECT 
    average_cost_for_two,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(aggregate_rating), 2) AS avg_rating
FROM zomato_restaurants
GROUP BY average_cost_for_two
ORDER BY average_cost_for_two DESC;