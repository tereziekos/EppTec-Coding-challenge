INSERT INTO client (first_name, last_name, email, phone_number, address, country) VALUES
  ('Alice', 'Smith', 'alice.smith@example.com', '555-1234', '123 Main St', 'United States'),
  ('Bob', 'Johnson', 'bob.johnson@example.com', '555-5678', '456 Elm St', 'United States'),
  ('Charlie', 'Brown', 'charlie.brown@example.com', '555-2468', '789 Oak St', 'United States');

INSERT INTO account (client_id, account_number, account_type) VALUES
  (1, '1234567890', 'Checking'),
  (1, '0987654321', 'Savings'),
  (2, '2345678901', 'Checking'),
  (3, '3456789012', 'Checking'),
  (3, '5678901234', 'Savings');

INSERT INTO transaction_type (name, description) VALUES
  ('Deposit', 'Money deposited to the account'),
  ('Withdrawal', 'Money withdrawn from the account'),
  ('Transfer', 'Money transferred between accounts');

INSERT INTO transactions (sender_account_id, recipient_account_id, transaction_type_id, amount, description) VALUES
  (1, 1, 1, 1000, 'Initial deposit'),
  (2, 2, 1, 2000, 'Initial deposit'),
  (3, 3, 1, 1500, 'Initial deposit'),
  (4, 4, 1, 3000, 'Initial deposit'),
  (5, 5, 1, 2500, 'Initial deposit'),
  (1, 3, 3, 200, 'Transfer to Bob'),
  (2, 5, 3, 500, 'Transfer to Charlie'),
  (3, 1, 3, 100, 'Transfer from Alice'),
  (4, 5, 3, 300, 'Transfer to Charlie'),
  (5, 2, 3, 400, 'Transfer from Alice');

INSERT INTO balance (account_id, date, principal, interest, fees, end_of_day_balance) VALUES
  (1, '2023-04-30', 1000, 10, 2, 1008),
  (2, '2023-04-30', 2000, 20, 4, 2016),
  (3, '2023-04-30', 1500, 15, 3, 1512),
  (4, '2023-04-30', 3000, 30, 6, 3024),
  (5, '2023-04-30', 2500, 25, 5, 2520),
  (1, '2023-05-01', 1000, 10, 2, 1008),
  (2, '2023-05-01', 2000, 20, 4, 2016),
  (3, '2023-05-01', 1500, 15, 3, 1512),
  (4, '2023-05-01', 3000, 30, 6, 3024),
  (5, '2023-05-01', 2500, 25, 5, 2520);