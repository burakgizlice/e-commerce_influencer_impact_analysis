\pset pager off
\c influencer_analysis


-- Fancy title
\echo '==============================================='
\echo ' HEAD for the table influencer'
\echo '==============================================='
\echo '-----------------------------------------------'
\echo 'SELECT influencer_name, platform, category, follower_count, clicked_number, influencer_mail, still_partner, member_since'
\echo 'FROM influencer'
\echo 'LIMIT 10;'
\echo '-----------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-----------------------------------------------'

\echo ''

-- The actual query
SELECT influencer_name, platform, category, follower_count, clicked_number, influencer_mail, still_partner, member_since
FROM influencer 
LIMIT 10;

