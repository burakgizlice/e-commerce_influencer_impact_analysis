\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==================================================================================='
\echo '   INFLUENCER RETURN STATS: Returns and Total Payments Ordered by Return Count'
\echo '==================================================================================='
\echo '-----------------------------------------------------------------------------------'
\echo 'SELECT i.influencer_id, i.influencer_name,'
\echo '       r.total_returns AS total_returns,'
\echo '       SUM(p.amount) AS total_payment'
\echo 'FROM influencer i'
\echo 'JOIN ('
\echo '    SELECT c.channel AS influencer_id, COUNT(*) AS total_returns'
\echo '    FROM bought_by b'
\echo '    JOIN customer c ON b.customer_id = c.customer_id'
\echo "    WHERE b.status = 'returned' AND c.channel != -1"
\echo '    GROUP BY c.channel'
\echo ') r ON i.influencer_id = r.influencer_id'
\echo 'JOIN payment p ON p.influencer_id = i.influencer_id'
\echo 'GROUP BY i.influencer_id, i.influencer_name, r.total_returns'
\echo 'ORDER BY total_returns DESC;'
\echo '-----------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT i.influencer_id, i.influencer_name,
       r.total_returns AS total_returns,
       SUM(p.amount) AS total_payment
FROM influencer i
JOIN (
    SELECT c.channel AS influencer_id, COUNT(*) AS total_returns
    FROM bought_by b
    JOIN customer c ON b.customer_id = c.customer_id
    WHERE b.status = 'returned' AND c.channel != -1
    GROUP BY c.channel
) r ON i.influencer_id = r.influencer_id
JOIN payment p ON p.influencer_id = i.influencer_id
GROUP BY i.influencer_id, i.influencer_name, r.total_returns
ORDER BY total_returns DESC;
