{{ config(materialized='incremental', unique_key='HOST_ID') }}

SELECT 
    HOST_ID,
    REPLACE({{trimmer('HOST_NAME')}}, ' ', '_') as HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CASE 
        WHEN RESPONSE_RATE < 50 THEN 'LOW'
        WHEN RESPONSE_RATE < 75 THEN 'MEDIUM'
        ELSE 'HIGH'
    END as RESPONSE_RATING,
    CREATED_AT

FROM 
    {{ ref('bronze_hosts') }}