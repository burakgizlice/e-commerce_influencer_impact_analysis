\pset pager off
\c influencer_analysis

-- Fancy title
\echo '==============================================='
\echo ' All Deleted Customer Accounts'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT customer_id, customer_name, customer_mail, customer_phone, since AS account_creation_date'
\echo 'FROM customer'
\echo 'WHERE is_account_deleted = TRUE'
\echo 'ORDER BY since DESC;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT 
    customer_id,
    customer_name,
    customer_mail,
    customer_phone,
    since AS account_creation_date
FROM 
    customer
WHERE 
    is_account_deleted = TRUE
ORDER BY 
    since DESC;
