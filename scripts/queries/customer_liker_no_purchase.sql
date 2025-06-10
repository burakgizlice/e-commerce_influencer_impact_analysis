\pset pager off
\c influencer_analysis

-- Fancy title
\echo '=========================================================================='
\echo ' Customer Who Likes Products but Never Buys - Customer Behavior Analysis'
\echo '==========================================================================.'
\echo '---------------------------------------------------------------------------'
\echo 'SELECT c.customer_name, COUNT(l.product_id) AS total_likes,'
\echo 'COALESCE(SUM(CASE WHEN b.product_id IS NOT NULL THEN 1 ELSE 0 END), 0) AS total_buys'
\echo 'FROM liked_by l'
\echo 'JOIN customer c ON l.customer_id = c.customer_id'
\echo 'LEFT JOIN bought_by b ON l.customer_id = b.customer_id'
\echo 'WHERE b.customer_id IS NULL'
\echo 'GROUP BY c.customer_name'
\echo 'ORDER BY total_likes DESC'
\echo 'LIMIT 1;'
\echo '----------------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT 
    c.customer_name, 
    COUNT(l.product_id) AS total_likes,
    COALESCE(SUM(CASE WHEN b.product_id IS NOT NULL THEN 1 ELSE 0 END), 0) AS total_buys
FROM 
    liked_by l
JOIN 
    customer c ON l.customer_id = c.customer_id
LEFT JOIN 
    bought_by b ON l.customer_id = b.customer_id
WHERE 
    b.customer_id IS NULL
GROUP BY 
    c.customer_name
ORDER BY 
    total_likes DESC
LIMIT 1;
