\pset pager off
\c influencer_analysis

-- Fancy title
\echo '======================================================='
\echo '   CAMPAIGNS WITH ALL PAYMENTS MARKED AS PAID'
\echo '======================================================='
\echo '-------------------------------------------------------'
\echo 'SELECT DISTINCT c.campaign_id, c.campaign_name'
\echo 'FROM campaign c'
\echo 'JOIN payment p ON p.campaign_id = c.campaign_id'
\echo 'JOIN influencer i ON i.influencer_id = p.influencer_id'
\echo 'WHERE p.status = ''paid'';'
\echo '-------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-------------------------------------------------------'

-- The actual query
SELECT 
  DISTINCT c.campaign_id, 
  c.campaign_name
FROM campaign c
JOIN payment p ON p.campaign_id = c.campaign_id
JOIN influencer i ON i.influencer_id = p.influencer_id
WHERE p.status = 'paid';
