INSERT INTO sys3.hub_category (hk_category_id, category_id, load_dt, source)
SELECT
    cityHash64(номер_категории) AS hk_category_id,  -- Хэш по category_id
    номер_категории as category_id,
    now() AS load_dt,
    'source_system_3' AS source
FROM sys3.stg_category
ON DUPLICATE KEY UPDATE load_dt = now();

