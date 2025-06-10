\pset pager off
\c influencer_analysis

-- Fancy title
\echo '==============================================='
\echo ' Deleted Customer Accounts associated to Influencers'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT i.influencer_name, i.platform, COUNT(c.customer_id) AS deleted_users_count'
\echo 'FROM customer c'
\echo 'JOIN influencer i ON c.channel = i.influencer_id'
\echo 'WHERE c.is_account_deleted = TRUE'
\echo 'AND c.channel != -1'
\echo 'GROUP BY i.influencer_name, i.platform'
\echo 'ORDER BY deleted_users_count DESC'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT 
    i.influencer_name,
    i.platform,
    COUNT(c.customer_id) AS deleted_users_count
FROM customer c
JOIN influencer i ON c.channel = i.influencer_id  -- Match influencer using the channel attribute
WHERE c.is_account_deleted = TRUE  -- Filter customers who have deleted their accounts
AND c.channel != -1  -- Ensure the customer came through an influencer (exclude channel = -1)
GROUP BY i.influencer_name, i.platform
ORDER BY deleted_users_count DESC
LIMIT 10;
