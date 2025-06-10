\pset pager off
\c influencer_analysis

-- Fancy title
\echo '==================================================================================='
\echo '   INFLUENCER PAYMENTS AND CAMPAIGN BUDGET: Payments and Debt for Influencer 27'
\echo '==================================================================================='
\echo '-----------------------------------------------------------------------------------'
\echo 'SELECT i.influencer_id,'
\echo '       i.influencer_name,'
\echo '       SUM(CASE WHEN p.status = ''paid'' THEN p.amount ELSE 0 END) AS total_paid,'
\echo '       SUM(CASE WHEN p.status = ''to be paid'' THEN p.amount ELSE 0 END) AS total_debt,'
\echo '       SUM(c.budget) AS total_campaign_budget'
\echo 'FROM influencer i'
\echo 'JOIN payment p ON p.influencer_id = i.influencer_id'
\echo 'JOIN campaign c ON p.campaign_id = c.campaign_id'
\echo 'WHERE i.influencer_id = 27'
\echo 'GROUP BY i.influencer_id, i.influencer_name;'
\echo '-----------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT i.influencer_id,
       i.influencer_name,
       SUM(CASE WHEN p.status = 'paid' THEN p.amount ELSE 0 END) AS total_paid,
       SUM(CASE WHEN p.status = 'to be paid' THEN p.amount ELSE 0 END) AS total_debt,
       SUM(c.budget) AS total_campaign_budget
FROM influencer i
JOIN payment p ON p.influencer_id = i.influencer_id
JOIN campaign c ON p.campaign_id = c.campaign_id
WHERE i.influencer_id = 27
GROUP BY i.influencer_id, i.influencer_name;
