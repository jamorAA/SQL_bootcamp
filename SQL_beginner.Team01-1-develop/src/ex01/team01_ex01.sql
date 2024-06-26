INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT COALESCE(u.name, 'not defined') AS name,
	   COALESCE(u.lastname, 'not defined') AS lastname,
	   c.name AS currency_name,
	   b.money * COALESCE((SELECT rate_to_usd
				             FROM (  SELECT rate_to_usd, updated
						               FROM currency
						              WHERE b.currency_id = id AND updated < b.updated
						           ORDER BY 2 DESC
						              LIMIT 1) AS q),
				          (SELECT rate_to_usd
				             FROM (  SELECT rate_to_usd, updated
						               FROM currency
						              WHERE b.currency_id = id AND updated > b.updated
						           ORDER BY 2
						              LIMIT 1) AS q)) AS currency_in_usd
  FROM balance                                       AS b
       LEFT JOIN "user"                              AS u ON b.user_id = u.id
	   JOIN (SELECT DISTINCT id, name FROM currency) AS c ON b.currency_id = c.id
ORDER BY 1 DESC, 2, 3