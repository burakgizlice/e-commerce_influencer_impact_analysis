\pset pager off
\c influencer_analysis

-- Fancy title
\echo '===================================================================================='
\echo '   MOST ACTIVE INFLUENCERs IN ADVERTISING'
\echo '===================================================================================='
\echo '------------------------------------------------------------------------------------'
\echo 'SELECT i.influencer_id, i.influencer_name, '
\echo '       COUNT(DISTINCT a.campaign_id) AS campaign_count,'
\echo '       COUNT(DISTINCT a.product_id) AS product_count,'
\echo '       (COUNT(DISTINCT a.campaign_id) + COUNT(DISTINCT a.product_id)) AS total_activity'
\echo 'FROM influencer i'
\echo 'JOIN arranges a ON a.influencer_id = i.influencer_id'
\echo 'GROUP BY i.influencer_id, i.influencer_name'
\echo 'ORDER BY total_activity DESC'
\echo 'LIMIT 10;'
\echo '------------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '------------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT i.influencer_id, i.influencer_name, 
       COUNT(DISTINCT a.campaign_id) AS campaign_count,
       COUNT(DISTINCT a.product_id) AS product_count,
       (COUNT(DISTINCT a.campaign_id) + COUNT(DISTINCT a.product_id)) AS total_activity
FROM influencer i
JOIN arranges a ON a.influencer_id = i.influencer_id
GROUP BY i.influencer_id, i.influencer_name
ORDER BY total_activity DESC
LIMIT 10;
