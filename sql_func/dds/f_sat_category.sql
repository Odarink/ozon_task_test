INSERT INTO sys3.sat_category (hk_category_id, category_name, load_dt, source)
SELECT distinct
    hc.hk_category_id,
    sc.название_категории as category_name,
    now() AS load_dt,
    'source_system_1' AS source
FROM
    sys3.stg_category sc
JOIN
    sys3.hub_category hc ON cityHash64(sc.категория_товара) = hc.hk_category_id;