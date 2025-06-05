\pset pager off
\c influencer_analysis

-- Fancy title
\echo '===================================================================================='
\echo '   INFLUENCER WITH THE HIGHEST RETURN RATES'
\echo '===================================================================================='
\echo '------------------------------------------------------------------------------------'
\echo 'SELECT '
\echo '    i.influencer_id,'
\echo '    i.influencer_name,'
\echo '    COUNT(CASE WHEN bb.status = ''returned'' THEN 1 END) AS total_returns,'
\echo '    COUNT(bb.product_id) AS total_sales,'
\echo '    ROUND('
\echo '        COUNT(CASE WHEN bb.status = ''returned'' THEN 1 END)::decimal '
\echo '        / COUNT(bb.product_id), 2'
\echo '    ) AS return_rate'
\echo 'FROM influencer i'
\echo 'JOIN customer c ON c.channel = i.influencer_id'
\echo 'JOIN bought_by bb ON bb.customer_id = c.customer_id'
\echo 'GROUP BY i.influencer_id, i.influencer_name'
\echo 'HAVING COUNT(bb.product_id) > 0'
\echo 'ORDER BY return_rate DESC;'
\echo '------------------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '------------------------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT 
    i.influencer_id,
    i.influencer_name,
    COUNT(CASE WHEN bb.status = 'returned' THEN 1 END) AS total_returns,
    COUNT(bb.product_id) AS total_sales,
    ROUND(
        COUNT(CASE WHEN bb.status = 'returned' THEN 1 END)::decimal 
        / COUNT(bb.product_id), 2
    ) AS return_rate
FROM influencer i
JOIN customer c ON c.channel = i.influencer_id
JOIN bought_by bb ON bb.customer_id = c.customer_id
GROUP BY i.influencer_id, i.influencer_name
HAVING COUNT(bb.product_id) > 0
ORDER BY return_rate DESC;
