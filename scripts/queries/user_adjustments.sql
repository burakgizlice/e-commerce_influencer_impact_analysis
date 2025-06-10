\pset pager off
\c influencer_analysis


-- Fancy title
\echo '======================================================================='
\echo '   PRODUCT MANAGERS & ADJUSTMENT COUNT: Sorted by Most Adjustments'
\echo '======================================================================='
\echo '------------------------------------------------------------------------'
\echo 'SELECT u.user_name, COUNT(*) AS adjustment_count'
\echo 'FROM adjusts a'
\echo 'JOIN user_table u ON a.user_id = u.user_id'
\echo "WHERE u.user_role = 'Product Manager'"
\echo 'GROUP BY u.user_name'
\echo 'ORDER BY adjustment_count DESC;'
\echo '------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT u.user_name, COUNT(*) AS adjustment_count
FROM adjusts a
JOIN user_table u ON a.user_id = u.user_id
WHERE u.user_role = 'Product Manager'
GROUP BY u.user_name
ORDER BY adjustment_count DESC;
