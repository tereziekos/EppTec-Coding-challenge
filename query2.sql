WITH monthly_client_total_claims AS (
    SELECT client_id,
        SUM(principal + interest + fees) AS total_claim
    FROM balance
        JOIN account ON balance.account_id = account.id
    WHERE date = strftime(
            '%Y-%m-%d',
            strftime('%Y-%m-01', 'now'),
            '-1 day'
        )
    GROUP BY client_id
)
SELECT client.id AS client_id,
    client.first_name,
    client.last_name,
    monthly_client_total_claims.total_claim
FROM client
    JOIN monthly_client_total_claims ON client.id = monthly_client_total_claims.client_id
ORDER BY monthly_client_total_claims.total_claim DESC
LIMIT 10;