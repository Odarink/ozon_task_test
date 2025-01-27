INSERT INTO sys3.link_category_product (hk_link_category_product, hk_category_id, hk_product_id, load_dt, source)
SELECT distinct
    cityHash64(hc.hk_category_id, hp.hk_product_id) AS hk_link_category_product,
    hc.hk_category_id,
    hp.hk_product_id,
    now() AS load_dt,
    'source_system_1' AS source
FROM
    sys3.stg_category sc
JOIN
    sys3.hub_category hc ON cityHash64(sc.категория_товара) = hc.hk_category_id
JOIN
    sys3.hub_product hp ON cityHash64(sc.категория_товара) = hp.hk_product_id
ON DUPLICATE KEY UPDATE load_dt = now();