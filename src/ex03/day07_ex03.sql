WITH visits AS (
	SELECT pz.name, COUNT(*)
	FROM person_visits AS pv
		JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
	GROUP BY pz.name
	ORDER BY 2 DESC),
	 orders AS (
	SELECT pz.name, COUNT(*) 
	FROM person_order AS po
		JOIN menu AS m ON po.menu_id = m.id
		JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
	GROUP BY pz.name
	ORDER BY 2 DESC)
	
	
SELECT visits.name, 
	   COALESCE(visits.count, 0) + COALESCE(orders.count, 0) AS total_count
FROM visits
	FULL JOIN orders ON visits.name = orders.name
ORDER BY 2 DESC, 1;
