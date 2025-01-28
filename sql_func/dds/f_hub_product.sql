INSERT INTO sys3.hub_products (hk_product_id, product_id, load_dt, source)
SELECT distinct
    cityHash64(номер_товара) AS hk_product_id,  -- Хэш по product_id
    номер_товара as product_id,
    now() AS load_dt,
    'source_system_3' AS source
FROM sys3.stg_category;
