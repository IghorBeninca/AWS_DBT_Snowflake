{{ config(materialized='incremental', unique_key='LISTING_ID') }}

SELECT 
    LISTING_ID,
    HOST_ID,
    {{trimmer('PROPERTY_TYPE')}} as PROPERTY_TYPE,
    {{trimmer('ROOM_TYPE')}} as ROOM_TYPE,
    {{trimmer('CITY')}} as CITY,
    {{trimmer('COUNTRY')}} as COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
    {{tag('PRICE_PER_NIGHT')}} as PRICE_RATING,
    CREATED_AT

FROM 
    {{ ref('bronze_listings') }}