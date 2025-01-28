INSERT INTO sys3.sat_product (hk_product_id, product_name, load_dt, source)
SELECT distinct
    hp.hk_product_id,
    sc.название_товара as product_name,
    now() AS load_dt,
    'source_system_1' AS source
FROM
    sys3.stg_category sc
JOIN
    sys3.hub_product hp ON cityHash64(sc.номер_товара) = hp.hk_product_id;