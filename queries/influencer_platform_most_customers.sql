\pset pager off
\c influencer_analysis

-- Fancy title
\echo '===================================================================================='
\echo '   PLATFORM INFLUENCER WITH THE MOST CUSTOMERS'
\echo '===================================================================================='
\echo '------------------------------------------------------------------------------------'
\echo 'SELECT platform, influencer_name, COUNT(c.customer_id) AS total_customers'
\echo 'FROM influencer i'
\echo 'JOIN customer c ON c.channel = i.influencer_id'
\echo 'GROUP BY platform, influencer_name'
\echo 'ORDER BY total_customers DESC;'
\echo '------------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '------------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT platform, influencer_name, COUNT(c.customer_id) AS total_customers
FROM influencer i
JOIN customer c ON c.channel = i.influencer_id
GROUP BY platform, influencer_name
ORDER BY total_customers DESC;
