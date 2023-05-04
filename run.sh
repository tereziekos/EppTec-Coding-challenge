# creates the dabatase structure, basically input from the DBML
sqlite3 Test.db ".read init.sql" 
# populates with dummy data, so we can test the 2 queries
sqlite3 Test.db ".read seed.sql" 
# first query gives total principals at the end of the month which are > c, default is 1000
sqlite3 Test.db ".read query1.sql" 
# second query gives 10 clients with highest claims at the first day of the month
sqlite3 Test.db ".read query2.sql"