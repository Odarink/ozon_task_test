INSERT INTO sys3.hub_sales (hk_marketing_id, product_id, marketing_dt, load_dt, source)
SELECT
    cityHash64(номер_товара, дата) AS hk_marketing_id,  -- Создание хэш-ключа по номеру продажи и дате
    номер_товара as product_id,
    дата::date as marketing_dt,
    now() AS load_dt,
    'source_system_2' AS source
FROM sys1.stg_marketing
ON DUPLICATE KEY UPDATE load_dt = now();
