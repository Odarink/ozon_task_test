INSERT INTO sys3.link_sales_product (hk_link_sales_product, hk_sale_id, hk_product_id, load_dt, source)
SELECT distinct
    cityHash64(hs.hk_sale_id, hp.hk_product_id) AS hk_link_sales_product,
    hs.hk_sale_id,
    hp.hk_product_id,
    now() AS load_dt,
    'source_system_1' AS source
FROM
    sys3.stg_sales ss
JOIN
    sys3.hub_sales hs ON cityHash64(ss.номер_заказа) = hs.hk_sale_id
JOIN
    sys3.hub_product hp ON cityHash64(ss.номер_товара) = hp.hk_product_id;
OPTIMIZE TABLE sys3.link_sales_product;
