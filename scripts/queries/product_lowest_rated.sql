\pset pager off
\c influencer_analysis

-- Fancy titlee
\echo '==================================================================='
\echo '   LOWEST RATED PRODUCTS: Average Rating Below 3 (Sorted Lowest)'
\echo '==================================================================='
\echo '-------------------------------------------------------------------'
\echo 'SELECT p.product_id, p.title, ROUND(AVG(bb.rating), 2) AS avg_rating'
\echo 'FROM product p'
\echo 'JOIN bought_by bb ON bb.product_id = p.product_id'
\echo 'GROUP BY p.product_id, p.title'
\echo 'HAVING AVG(bb.rating) < 3'
\echo 'ORDER BY avg_rating;'
\echo '-------------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-------------------------------------------------------------------'

\echo ''

-- The actual query
SELECT p.product_id, p.title, ROUND(AVG(bb.rating), 2) AS avg_rating
FROM product p
JOIN bought_by bb ON bb.product_id = p.product_id
GROUP BY p.product_id, p.title
HAVING AVG(bb.rating) < 3
ORDER BY avg_rating;
