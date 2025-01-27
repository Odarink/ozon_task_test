INSERT INTO sys3.sat_sales (hk_marketing_id, amount, load_dt, source)
SELECT
    hs.hk_marketing_id,
    ss.сумма_рекламы as amount,
    now() AS load_dt,
    'source_system_2' AS source
FROM
    sys3.stg_marketing ss
JOIN
    sys3.hub_marketing hs ON cityHash64(ss.номер_товара, ss.дата) = hs.hk_marketing_id
ON DUPLICATE KEY UPDATE load_dt = now();