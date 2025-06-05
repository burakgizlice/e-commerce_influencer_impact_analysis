\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table liked_by'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT customer_id, product_id, channel, liked_date'
\echo 'FROM liked_by'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT customer_id, product_id, channel, liked_date
FROM liked_by 
LIMIT 10;

