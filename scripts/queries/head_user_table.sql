\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table user_table'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT user_name, user_role, user_mail, user_password, is_active, member_since'
\echo 'FROM user_table'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT user_name, user_role, user_mail, user_password, is_active, member_since
FROM user_table 
LIMIT 10;

