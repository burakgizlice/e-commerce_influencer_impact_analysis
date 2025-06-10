\pset pager off
\c influencer_analysis

-- Fancy title
\echo '======================================================='
\echo ' CAMPAIGNS WITH PAYMENTS "TO BE PAID" AND TOTAL AMOUNT'
\echo '======================================================='
\echo '-------------------------------------------------------'
\echo 'SELECT c.campaign_id, c.campaign_name, SUM(p.amount) AS total_amount_to_be_paid'
\echo 'FROM campaign c'
\echo 'JOIN payment p ON p.campaign_id = c.campaign_id'
\echo 'WHERE p.status = ''to be paid'''
\echo 'GROUP BY c.campaign_id, c.campaign_name;'
\echo '-------------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '-------------------------------------------------------'

-- The actual query
SELECT c.campaign_id, c.campaign_name, SUM(p.amount) AS total_amount_to_be_paid
FROM campaign c
JOIN payment p ON p.campaign_id = c.campaign_id
WHERE p.status = 'to be paid'
GROUP BY c.campaign_id, c.campaign_name;
