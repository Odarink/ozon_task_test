INSERT INTO sys3.sat_sales_product (hk_link_sales_product, sale_amount, load_dt, source)
SELECT
    lsp.hk_link_sales_product,
    ss.сумма_продажи AS sale_amount,
    now() AS load_dt,
    'source_system_1' AS source
FROM
    sys3.stg_sales ss
JOIN
    sys3.hub_sales hs ON cityHash64(ss.номер_заказа) = hs.hk_sale_id
JOIN
    sys3.hub_product hp ON cityHash64(ss.номер_товара) = hp.hk_product_id
JOIN
    sys3.link_sales_product lsp ON hs.hk_sale_id = lsp.hk_sale_id AND hp.hk_product_id = lsp.hk_product_id;