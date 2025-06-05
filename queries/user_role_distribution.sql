\pset pager off
\c influencer_analysis

-- Fancy title
\echo '============================================================='
\echo '   USER ROLE DISTRIBUTION: Counts of Users per Role'
\echo '============================================================='
\echo '-------------------------------------------------------------'
\echo 'SELECT user_role, COUNT(*) AS user_count'
\echo 'FROM user_table'
\echo 'GROUP BY user_role'
\echo 'ORDER BY user_count DESC;'
\echo '-------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-------------------------------------------------------------'

\echo ''

-- The actual query
SELECT user_role, COUNT(*) AS user_count
FROM user_table
GROUP BY user_role
ORDER BY user_count DESC;
