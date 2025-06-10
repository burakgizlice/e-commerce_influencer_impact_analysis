\pset pager off
\c influencer_analysis

-- Fancy title
\echo '===================================================================================='
\echo '   INFLUENCER WITH THE LOWEST AVERAGE RATINGS'
\echo '===================================================================================='
\echo '------------------------------------------------------------------------------------'
\echo 'SELECT i.influencer_id, i.influencer_name, '
\echo '       ROUND(AVG(bb.rating), 2) AS average_rating'
\echo 'FROM influencer i'
\echo 'JOIN customer c ON c.channel = i.influencer_id'
\echo 'JOIN bought_by bb ON bb.customer_id = c.customer_id'
\echo 'WHERE bb.rating IS NOT NULL'
\echo 'GROUP BY i.influencer_id, i.influencer_name'
\echo 'ORDER BY average_rating;'
\echo '------------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '------------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT i.influencer_id, i.influencer_name, 
       ROUND(AVG(bb.rating), 2) AS average_rating
FROM influencer i
JOIN customer c ON c.channel = i.influencer_id
JOIN bought_by bb ON bb.customer_id = c.customer_id
WHERE bb.rating IS NOT NULL
GROUP BY i.influencer_id, i.influencer_name
ORDER BY average_rating;
