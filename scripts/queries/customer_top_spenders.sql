\pset pager off
\c influencer_analysis

-- Fancy title
\echo '==================================================='
\echo ' CUSTOMER TOP SPENDERS'
\echo '==================================================='
\echo '---------------------------------------------------'
\echo 'SELECT c.customer_id,'
\echo '       c.customer_name,'
\echo '       c.customer_mail,'
\echo '       SUM(b.quantity * p.product_price) AS total_spent'
\echo 'FROM customer c'
\echo 'JOIN bought_by b ON c.customer_id = b.customer_id'
\echo 'JOIN product p ON b.product_id = p.product_id'
\echo 'WHERE b.status = ''delivered'' -- Only count delivered orders'
\echo 'GROUP BY c.customer_id, c.customer_name, c.customer_mail'
\echo 'ORDER BY total_spent DESC'
\echo 'LIMIT 10;'
\echo '---------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '---------------------------------------------------'

-- The actual query
SELECT 
    c.customer_id,
    c.customer_name,
    c.customer_mail,
    SUM(b.quantity * p.product_price) AS total_spent
FROM 
    customer c
JOIN 
    bought_by b ON c.customer_id = b.customer_id
JOIN 
    product p ON b.product_id = p.product_id
WHERE 
    b.status = 'delivered' -- Only count delivered orders
GROUP BY 
    c.customer_id, c.customer_name, c.customer_mail
ORDER BY 
    total_spent DESC
LIMIT 10;
