\pset pager off
\c influencer_analysis


-- Fancy title
\echo '===================================================================================='
\echo '   INFLUENCER BASED ANNUAL SALES PERFORMANCE ANALYSIS'
\echo '===================================================================================='
\echo '------------------------------------------------------------------------------------'
\echo 'SELECT '
\echo '    EXTRACT(YEAR FROM b.bought_date) AS year,'
\echo '    i.influencer_id,'
\echo '    i.influencer_name,'
\echo '    SUM(b.quantity) AS total_sales'
\echo 'FROM bought_by b'
\echo 'JOIN customer c ON b.customer_id = c.customer_id'
\echo 'JOIN influencer i ON c.channel = i.influencer_id'
\echo 'GROUP BY year, i.influencer_id, i.influencer_name'
\echo 'ORDER BY year, total_sales DESC;'
\echo '------------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '------------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT 
    EXTRACT(YEAR FROM b.bought_date) AS year,
    i.influencer_id,
    i.influencer_name,
    SUM(b.quantity) AS total_sales
FROM bought_by b
JOIN customer c ON b.customer_id = c.customer_id
JOIN influencer i ON c.channel = i.influencer_id
GROUP BY year, i.influencer_id, i.influencer_name
ORDER BY year, total_sales DESC;
