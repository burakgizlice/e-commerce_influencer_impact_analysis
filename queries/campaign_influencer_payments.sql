\pset pager off
\c influencer_analysis

-- Fancy title
\echo '======================================================================'
\echo '   INFLUENCERS & PAYMENTS: Campaign ID 5'
\echo '======================================================================'
\echo '----------------------------------------------------------------------'
\echo 'SELECT i.influencer_id, i.influencer_name, c.campaign_name, p.amount, p.status'
\echo 'FROM payment p'
\echo 'JOIN influencer i ON i.influencer_id = p.influencer_id'
\echo 'JOIN campaign c ON c.campaign_id = p.campaign_id'
\echo 'WHERE p.campaign_id = 5;'
\echo '----------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '----------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT i.influencer_id, i.influencer_name, c.campaign_name, p.amount, p.status
FROM payment p
JOIN influencer i ON i.influencer_id = p.influencer_id
JOIN campaign c ON c.campaign_id = p.campaign_id
WHERE p.campaign_id = 5;
