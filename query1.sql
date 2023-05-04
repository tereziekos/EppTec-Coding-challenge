WITH monthly_client_principals AS (
    SELECT client_id,
        SUM(principal) AS total_principal
    FROM balance
        JOIN account ON balance.account_id = account.id
    WHERE strftime('%m', date) = strftime('%m', 'now')
        AND strftime('%Y', date) = strftime('%Y', 'now')
    GROUP BY client_id
)
SELECT client.id AS client_id,
    client.first_name,
    client.last_name
FROM client
    JOIN monthly_client_principals ON client.id = monthly_client_principals.client_id
WHERE monthly_client_principals.total_principal > 1000;  -- edit this to change the threshold