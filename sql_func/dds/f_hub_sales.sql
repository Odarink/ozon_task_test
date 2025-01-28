INSERT INTO sys3.hub_sales (hk_sale_id, sale_id, load_dt, source)
SELECT distinct
    cityHash64(номер_заказа) AS hk_sale_id,  -- Создание хэш-ключа только на основе бизнес-ключа
    номер_заказа as sale_id,
    now() AS load_dt,
    'source_system_1' AS source
FROM sys1.stg_sales;
OPTIMIZE TABLE sys3.hub_sales;
