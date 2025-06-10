\pset pager off
\c influencer_analysis

-- Fancy title
\echo '======================================================================================'
\echo '   INFLUENCER CUSTOMER REACH: Total Customers and Payments Ordered by Reach'
\echo '======================================================================================'
\echo '--------------------------------------------------------------------------------------'
\echo 'SELECT i.influencer_id,'
\echo '       i.influencer_name,'
\echo '       c.total_customers AS total_customers,'
\echo '       SUM(p.amount) AS total_payment'
\echo 'FROM influencer i'
\echo 'JOIN ('
\echo '    SELECT channel AS influencer_id, COUNT(*) AS total_customers'
\echo '    FROM customer'
\echo '    WHERE channel != -1'
\echo '    GROUP BY channel'
\echo ') c ON i.influencer_id = c.influencer_id'
\echo 'JOIN payment p ON p.influencer_id = i.influencer_id'
\echo 'GROUP BY i.influencer_id, i.influencer_name, c.total_customers'
\echo 'ORDER BY total_customers DESC;'
\echo '--------------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '--------------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT i.influencer_id,
       i.influencer_name,
       c.total_customers AS total_customers,
       SUM(p.amount) AS total_payment
FROM influencer i
JOIN (
    SELECT channel AS influencer_id, COUNT(*) AS total_customers
    FROM customer
    WHERE channel != -1
    GROUP BY channel
) c ON i.influencer_id = c.influencer_id
JOIN payment p ON p.influencer_id = i.influencer_id
GROUP BY i.influencer_id, i.influencer_name, c.total_customers
ORDER BY total_customers DESC;
