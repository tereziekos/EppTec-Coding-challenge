CREATE TABLE client (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone_number TEXT,
  address TEXT,
  country TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE account (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  client_id INTEGER NOT NULL,
  account_number TEXT NOT NULL,
  account_type TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(client_id) REFERENCES client(id)
);
CREATE TABLE transaction_type (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  description TEXT
);
CREATE TABLE transactions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sender_account_id INTEGER NOT NULL,
  recipient_account_id INTEGER NOT NULL,
  transaction_type_id INTEGER NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  description TEXT,
  transaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(sender_account_id) REFERENCES account(id),
  FOREIGN KEY(recipient_account_id) REFERENCES account(id),
  FOREIGN KEY(transaction_type_id) REFERENCES transaction_type(id)
);
CREATE TABLE balance (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  account_id INTEGER NOT NULL,
  date DATE NOT NULL,
  principal DECIMAL(10, 2) NOT NULL,
  interest DECIMAL(10, 2) NOT NULL,
  fees DECIMAL(10, 2) NOT NULL,
  end_of_day_balance DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY(account_id) REFERENCES account(id)
);