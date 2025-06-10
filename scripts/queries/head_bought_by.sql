\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table bought_by'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT product_id, customer_id, quantity, status, channel, rating, bought_date'
\echo 'FROM bought_by'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT product_id, customer_id, quantity, status, channel, rating, bought_date
FROM bought_by 
LIMIT 10;

