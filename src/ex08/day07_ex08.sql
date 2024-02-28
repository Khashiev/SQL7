SELECT p.address, 
	   pz.name, 
	   COUNT(*) AS count_of_orders
FROM person_order AS po
	JOIN menu AS m ON po.menu_id = m.id
	JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
	JOIN person AS p ON po.person_id = p.id
GROUP BY 2, 1
ORDER BY 1, 2;
