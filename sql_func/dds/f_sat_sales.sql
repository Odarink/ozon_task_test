INSERT INTO sys3.sat_sales (hk_sale_id, sale_dt, load_dt, source)
SELECT
    hs.hk_sale_id,
    ss.дата,
    now() AS load_dt,
    'source_system_1' AS source
FROM
    sys3.stg_sales ss
JOIN
    sys3.hub_sales hs ON cityHash64(ss.номер_заказа) = hs.hk_sale_id;
OPTIMIZE TABLE sys3.sat_sales;
