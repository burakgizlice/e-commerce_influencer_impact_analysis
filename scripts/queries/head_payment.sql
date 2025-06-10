\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table payment'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT campaign_id, influencer_id, amount, status, payment_date'
\echo 'FROM payment'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT campaign_id, influencer_id, amount, status, payment_date
FROM payment 
LIMIT 10;

