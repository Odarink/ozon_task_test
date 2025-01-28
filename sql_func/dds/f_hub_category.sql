INSERT INTO sys3.hub_category (hk_category_id, category_id, load_dt, source)
SELECT distinct
    cityHash64(категория_товара) AS hk_category_id,  -- Хэш по category_id
    категория_товара as category_id,
    now() AS load_dt,
    'source_system_3' AS source
FROM sys3.stg_category;

