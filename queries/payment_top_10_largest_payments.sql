\pset pager off
\c influencer_analysis

-- Fancy title
\echo '===================================================================================='
\echo '   TOP 10 LARGEST PAYMENTS: Highest Single Payments Made to Influencers'
\echo '===================================================================================='
\echo '------------------------------------------------------------------------------------'
\echo 'SELECT i.influencer_id, i.influencer_name, p.amount, p.date'
\echo 'FROM payment p'
\echo 'JOIN influencer i ON i.influencer_id = p.influencer_id'
\echo 'ORDER BY p.amount DESC'
\echo 'LIMIT 10;'
\echo '------------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '------------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT i.influencer_id, i.influencer_name, p.amount, p.payment_date
FROM payment p
JOIN influencer i ON i.influencer_id = p.influencer_id
ORDER BY p.amount DESC
LIMIT 10;
