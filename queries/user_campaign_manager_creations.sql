\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==========================================================================='
\echo '   CAMPAIGN MANAGERS & NUMBER OF CAMPAIGNS CREATED: Sorted by Most'
\echo '==========================================================================='
\echo '---------------------------------------------------------------------------'
\echo 'SELECT u.user_name, COUNT(DISTINCT a.campaign_id) AS created_campaigns'
\echo 'FROM arranges a'
\echo 'JOIN user_table u ON a.user_id = u.user_id'
\echo "WHERE u.user_role = 'Campaign Manager'"
\echo 'GROUP BY u.user_name'
\echo 'ORDER BY created_campaigns DESC;'
\echo '---------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '---------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT u.user_name, COUNT(DISTINCT a.campaign_id) AS created_campaigns
FROM arranges a
JOIN user_table u ON a.user_id = u.user_id
WHERE u.user_role = 'Campaign Manager'
GROUP BY u.user_name
ORDER BY created_campaigns DESC;
