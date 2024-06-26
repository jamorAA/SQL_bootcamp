WITH aggr AS (
  SELECT user_id, type, SUM(money) AS volume, currency_id
    FROM balance
GROUP BY user_id, type, currency_id ),
     last_rate AS (
SELECT id, rate_to_usd
  FROM currency
 WHERE updated = (SELECT MAX(updated) FROM currency AS c WHERE id = c.id) )
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
	   aggr.type,
	   aggr.volume,
	   COALESCE(c.name, 'not defined') AS currency_name,
	   COALESCE((SELECT rate_to_usd FROM last_rate WHERE id = c.id), 1) AS last_rate_to_usd,
	   aggr.volume * COALESCE((SELECT rate_to_usd FROM last_rate WHERE id = c.id), 1) AS total_volume_in_usd
  FROM aggr
       LEFT JOIN "user"                                   AS u ON aggr.user_id = u.id
       LEFT JOIN (SELECT DISTINCT id, name FROM currency) AS c ON aggr.currency_id = c.id
ORDER BY 1 DESC, 2, 3