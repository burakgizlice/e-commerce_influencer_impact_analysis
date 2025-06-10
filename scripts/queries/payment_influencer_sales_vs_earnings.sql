\pset pager off
\c influencer_analysis

-- Fancy title
\echo '================================================================================'
\echo '   INFLUENCER SALES STATS: Product Sales and Total Payments Ordered by Sales'
\echo '================================================================================'
\echo '--------------------------------------------------------------------------------'
\echo 'SELECT i.influencer_id, '
\echo '       i.influencer_name,'
\echo '       s.total_sales AS total_sales,'
\echo '       SUM(p.amount) AS total_payment'
\echo 'FROM influencer i'
\echo 'JOIN ('
\echo '    SELECT c.channel AS influencer_id, SUM(b.quantity) AS total_sales'
\echo '    FROM bought_by b'
\echo '    JOIN customer c ON b.customer_id = c.customer_id'
\echo '    WHERE c.channel != -1'
\echo '    GROUP BY c.channel'
\echo ') s ON i.influencer_id = s.influencer_id'
\echo 'JOIN payment p ON p.influencer_id = i.influencer_id'
\echo 'GROUP BY i.influencer_id, i.influencer_name, s.total_sales'
\echo 'ORDER BY total_sales DESC;'
\echo '--------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '--------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT i.influencer_id, 
       i.influencer_name,
       s.total_sales AS total_sales,
       SUM(p.amount) AS total_payment
FROM influencer i
JOIN (
    SELECT c.channel AS influencer_id, SUM(b.quantity) AS total_sales
    FROM bought_by b
    JOIN customer c ON b.customer_id = c.customer_id
    WHERE c.channel != -1
    GROUP BY c.channel
) s ON i.influencer_id = s.influencer_id
JOIN payment p ON p.influencer_id = i.influencer_id
GROUP BY i.influencer_id, i.influencer_name, s.total_sales
ORDER BY total_sales DESC;
