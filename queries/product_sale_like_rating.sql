\pset pager off
\c influencer_analysis

-- Fancy title
\echo '==============================================='
\echo '  PRODUCT INSIGHTS: Detailed Stats for Product 10'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT p.product_id, p.title,'
\echo '       p.sale_quantity AS total_purchases,'
\echo '       COUNT(DISTINCT lb.customer_id) AS total_likes,'
\echo '       ROUND(AVG(bb.rating), 2) AS avg_rating'
\echo 'FROM product p'
\echo 'JOIN bought_by bb ON bb.product_id = p.product_id'
\echo 'JOIN liked_by lb ON lb.product_id = p.product_id'
\echo 'WHERE p.product_id = 10'
\echo 'GROUP BY p.product_id, p.title;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT p.product_id, p.title,
       p.sale_quantity AS total_purchases,
       COUNT(DISTINCT lb.customer_id) AS total_likes,
       ROUND(AVG(bb.rating), 2) AS avg_rating
FROM product p
JOIN bought_by bb ON bb.product_id = p.product_id
JOIN liked_by lb ON lb.product_id = p.product_id
WHERE p.product_id = 10
GROUP BY p.product_id, p.title;
