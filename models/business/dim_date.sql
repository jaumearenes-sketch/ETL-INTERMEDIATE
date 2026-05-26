WITH RECURSIVE calendar AS (
    SELECT min_date AS date_key
    FROM (
        SELECT MIN(date_key) AS min_date, MAX(date_key) AS max_date
        FROM (
            SELECT order_date AS date_key
            FROM {{ ref('stg_orders') }}

            UNION ALL

            SELECT ship_date AS date_key
            FROM {{ ref('stg_lineitem') }}
        ) source_dates
        WHERE date_key IS NOT NULL
    ) boundaries

    UNION ALL

    SELECT DATEADD(day, 1, calendar.date_key) AS date_key
    FROM calendar
    CROSS JOIN (
        SELECT MAX(date_key) AS max_date
        FROM (
            SELECT order_date AS date_key
            FROM {{ ref('stg_orders') }}

            UNION ALL

            SELECT ship_date AS date_key
            FROM {{ ref('stg_lineitem') }}
        ) source_dates
        WHERE date_key IS NOT NULL
    ) boundaries
    WHERE calendar.date_key < boundaries.max_date
)

SELECT
    date_key,
    YEAR(date_key) AS year,
    QUARTER(date_key) AS quarter,
    MONTH(date_key) AS month,
    MONTHNAME(date_key) AS month_name,
    WEEKOFYEAR(date_key) AS week_of_year,
    DAYOFWEEK(date_key) AS day_of_week,
    DAYNAME(date_key) AS day_name,
    DAYOFMONTH(date_key) AS day_of_month,
    {{ expression_is_true('DAYOFWEEK(date_key) IN (0, 6)') }} AS is_weekend
FROM calendar
