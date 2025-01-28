INSERT INTO sys3.sat_category_product (hk_link_category_product, date_from, load_dt, source)
SELECT
    lcp.hk_link_category_product,
    (ss.date_from, ss.дата) as date_from,
    now() AS load_dt,
    'source_system_1' AS source
FROM
    sys3.stg_category ss
JOIN
    sys3.hub_category hs ON cityHash64(ss.категория_товара) = hs.hk_category_id
JOIN
    sys3.hub_product hp ON cityHash64(ss.номер_товара) = hp.hk_product_id
JOIN
    sys3.link_category_product lcp ON hs.hk_category_id = lcp.hk_category_id AND hp.hk_product_id = lcp.hk_product_id;
OPTIMIZE TABLE sys3.sat_category_product;
