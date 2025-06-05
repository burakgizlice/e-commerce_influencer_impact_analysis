\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table arranges'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT product_id, influencer_id, user_id, campaign_id'
\echo 'FROM arranges'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT product_id, influencer_id, user_id, campaign_id
FROM arranges
LIMIT 10;

