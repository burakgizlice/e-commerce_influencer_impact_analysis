\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table product'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT title, category, description, product_price, on_sale, stock_quantity, sale_quantity'
\echo 'FROM product'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT title, category, description, product_price, on_sale, stock_quantity, sale_quantity
FROM product
LIMIT 10;

