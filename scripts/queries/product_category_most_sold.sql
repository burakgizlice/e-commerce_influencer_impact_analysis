\pset pager off
\c influencer_analysis

-- Fancy title
\echo '============================================================='
\echo '   MOST POPULAR CATEGORIES: Sorted by Total Sales Volume'
\echo '============================================================='
\echo '-------------------------------------------------------------'
\echo 'SELECT p.category, SUM(p.sale_quantity) AS total_sales'
\echo 'FROM product p'
\echo 'GROUP BY p.category'
\echo 'ORDER BY total_sales DESC;'
\echo '-------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-------------------------------------------------------------'

\echo ''

-- The actual query
SELECT p.category, SUM(p.sale_quantity) AS total_sales
FROM product p
GROUP BY p.category
ORDER BY total_sales DESC;
