\pset pager off
\c influencer_analysis

-- Fancy title
\echo '======================================================='
\echo '   ACTIVE CAMPAIGNS (NO END DATE)'
\echo '======================================================='
\echo '-------------------------------------------------------'
\echo 'SELECT campaign_name, start_date, end_date, budget'
\echo 'FROM campaign'
\echo 'WHERE end_date IS NULL'
\echo 'ORDER BY budget DESC LIMIT 10;'
\echo '-------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-------------------------------------------------------'

\echo ''

-- The actual query
SELECT campaign_name, start_date, end_date, budget 
FROM campaign 
WHERE end_date IS NULL
ORDER BY budget DESC 
LIMIT 10;
