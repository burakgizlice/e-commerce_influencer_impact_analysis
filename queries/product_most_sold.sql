\pset pager off
\c influencer_analysis

-- Fancy title
\echo '=============================================================='
\echo '   PRODUCT CATALOG: Sorted by Sale Quantity (High to Low)'
\echo '=============================================================='
\echo '--------------------------------------------------------------'
\echo 'SELECT product_id, sale_quantity, title, category, description'
\echo 'FROM product p'
\echo 'ORDER BY sale_quantity DESC;'
\echo '--------------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '--------------------------------------------------------------'

\echo ''

-- The actual query
SELECT product_id, sale_quantity, title, category, description
FROM product p
ORDER BY sale_quantity DESC;
