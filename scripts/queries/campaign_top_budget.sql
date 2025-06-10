\pset pager off
\c influencer_analysis

-- Fancy title
\echo '======================================================='
\echo '   TOP 10 CAMPAIGNS BY BUDGET'
\echo '======================================================='
\echo '-------------------------------------------------------'
\echo 'SELECT campaign_name, start_date, end_date, budget'
\echo 'FROM campaign'
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
ORDER BY budget DESC 
LIMIT 10;
