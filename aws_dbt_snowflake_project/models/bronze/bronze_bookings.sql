{{ config(materialized='incremental') }}

SELECT * FROM {{ source('stg_snowflake', 'bookings') }}

{% if is_incremental() %}
    where CREATED_AT > (select COALESCE(max(CREATED_AT), '1900-01-01') from {{ this }})
{% endif %}