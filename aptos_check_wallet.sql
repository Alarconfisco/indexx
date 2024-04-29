SELECT 
ROW_NUMBER() OVER (ORDER BY SUM(tx_index) DESC NULLS FIRST, sender DESC NULLS FIRST ) AS rank_id,
sender AS address ,
SUM(tx_index) AS total_transactions
FROM aptos.user_transactions
where success = true
GROUP BY 2
ORDER BY total_transactions desc
LIMIT 1000000
