\pset pager off
\c influencer_analysis

-- Fancy title
\echo '============================================================='
\echo '   MOST LIKED PRODUCTS: Ordered by Like Count (High to Low)'
\echo '============================================================='
\echo '-------------------------------------------------------------'
\echo 'SELECT p.product_id, p.title, COUNT(lb.product_id) AS total_likes'
\echo 'FROM product p'
\echo 'JOIN liked_by lb ON lb.product_id = p.product_id'
\echo 'GROUP BY p.product_id, p.title'
\echo 'ORDER BY total_likes DESC;'
\echo '-------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-------------------------------------------------------------'

\echo ''

-- The actual query
SELECT p.product_id, p.title, COUNT(lb.product_id) AS total_likes
FROM product p
JOIN liked_by lb ON lb.product_id = p.product_id
GROUP BY p.product_id, p.title
ORDER BY total_likes DESC;
