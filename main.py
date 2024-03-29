import sys
import sqlite3


def execute_sql_query(database, query):
    conn = sqlite3.connect(database)
    cursor = conn.cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    conn.close()
    return results


def filter_clients_with_high_balance(database, neq_sign, balance_threshold):
    query = f"""
    SELECT client.id
    FROM client
    JOIN account ON client.id = account.client_id
    JOIN balance ON account.id = balance.account_id
    WHERE balance.end_of_day_balance {neq_sign} {balance_threshold}
    """
    return execute_sql_query(database, query)


def filter_clients_with_high_interest(database, neq_sign, interest_threshold):
    query = f"""
    SELECT client.id
    FROM client
    JOIN account ON client.id = account.client_id
    JOIN balance ON account.id = balance.account_id
    WHERE balance.interest {neq_sign} {interest_threshold}
    """
    return execute_sql_query(database, query)


def main(database, rules_file):
    with open(rules_file, "r") as file:
        rules = file.read().splitlines()

    filtered_clients = None

    for rule in rules:
        if rule.startswith("#") or rule == "":
            continue
        rule_parts = rule.split()
        rule_name = " ".join(rule_parts[:-2])
        sign = rule_parts[-2]
        threshold = float(rule_parts[-1])

        neq_sign = {"higher": ">", "lower": "<", "equal": "=", "not-equal": "!="}[
            sign.lower()
        ]

        if rule_name == "filter clients with balance":
            clients = set(
                client[0]
                for client in filter_clients_with_high_balance(
                    database, neq_sign, threshold
                )
            )
        elif rule_name == "filter clients with interest":
            clients = set(
                client[0]
                for client in filter_clients_with_high_interest(
                    database, neq_sign, threshold
                )
            )

        if filtered_clients is None:
            filtered_clients = clients
        else:
            filtered_clients.intersection_update(clients)

    query = f"""
    SELECT id, first_name, last_name
    FROM client
    WHERE id IN ({','.join(map(str, filtered_clients))})
    """
    results = execute_sql_query(database, query)
    print("Filtered clients:")
    print(results)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python main.py database rules.txt")
    else:
        main(sys.argv[1], sys.argv[2])
