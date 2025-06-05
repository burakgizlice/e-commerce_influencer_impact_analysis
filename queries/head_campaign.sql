\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table campaign'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT campaign_name, start_date, end_date, budget'
\echo 'FROM campaign'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT campaign_name, start_date, end_date, budget
FROM campaign 
LIMIT 10;

