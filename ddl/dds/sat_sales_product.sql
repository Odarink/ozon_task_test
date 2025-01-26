DROP TABLE IF EXISTS sys3.sat_sales_product;

CREATE TABLE sys3.sat_sales_product
(
    hk_link_sales_product       UInt64,
    sale_amount                 Decimal(18, 2),
    load_dt                     DateTime,
    source                      String
)
ENGINE = ReplacingMergeTree(load_dt)
PARTITION BY (load_dt)
ORDER BY (hk_link_sales_product);
