\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table adjusts'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT user_id, product_id, field, old_value, new_value, date_time'
\echo 'FROM adjusts'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT user_id, product_id, field, old_value, new_value, date_time
FROM adjusts 
LIMIT 10;

