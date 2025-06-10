\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table customer'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT customer_name, customer_mail, customer_phone, customer_address, channel, since, is_account_deleted'
\echo 'FROM customer'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT customer_name, customer_mail, customer_phone, customer_address, channel, since, is_account_deleted
FROM customer 
LIMIT 10;

