\pset pager off
\c influencer_analysis

-- Fancy title
\echo '===================================================================================='
\echo '   INFLUENCER BASED USER ACQUISITION BY YEAR'
\echo '===================================================================================='
\echo '------------------------------------------------------------------------------------'
\echo 'SELECT i.influencer_id, i.influencer_name,'
\echo '       EXTRACT(YEAR FROM c.since) AS year,'
\echo '       COUNT(c.customer_id) AS total_customers'
\echo 'FROM influencer i'
\echo 'JOIN customer c ON c.channel = i.influencer_id'
\echo 'GROUP BY i.influencer_id, i.influencer_name, year'
\echo 'ORDER BY year, total_customers DESC;'
\echo '------------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '------------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT i.influencer_id, i.influencer_name, 
       EXTRACT(YEAR FROM c.since) AS year,
       COUNT(c.customer_id) AS total_customers
FROM influencer i
JOIN customer c ON c.channel = i.influencer_id
GROUP BY i.influencer_id, i.influencer_name, year
ORDER BY year, total_customers DESC;
