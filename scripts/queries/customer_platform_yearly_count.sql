\pset pager off
\c influencer_analysis

-- Fancy title
\echo '==================================================='
\echo ' CUSTOMER COUNT BY PLATFORM AND YEAR'
\echo '==================================================='
\echo '---------------------------------------------------'
\echo 'SELECT EXTRACT(YEAR FROM c.since) AS year,'
\echo '       CASE WHEN c.channel = -1 THEN ''Direct'''
\echo '            ELSE i.platform END AS source_platform,'
\echo '       COUNT(c.customer_id) AS customer_count'
\echo 'FROM customer c'
\echo 'LEFT JOIN influencer i ON c.channel = i.influencer_id'
\echo 'GROUP BY year, source_platform'
\echo 'ORDER BY year, customer_count DESC;'
\echo '---------------------------------------------------'
\echo ''

-- Prompt user to continue
\prompt 'Press ENTER to execute the query...' dummy

\echo ''

\echo '---------------------------------------------------'

-- The actual query
SELECT 
    EXTRACT(YEAR FROM c.since) AS year,
    CASE 
        WHEN c.channel = -1 THEN 'Direct'
        ELSE i.platform
    END AS source_platform,
    COUNT(c.customer_id) AS customer_count
FROM 
    customer c
LEFT JOIN 
    influencer i ON c.channel = i.influencer_id
GROUP BY 
    year, source_platform
ORDER BY 
    year, customer_count DESC;
