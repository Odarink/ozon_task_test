DROP TABLE IF EXISTS sys3.sat_product;

CREATE TABLE sys3.sat_product
(
    hk_product_id   UInt64,
    product_name    String,
    load_dt         DateTime,
    source          String
)
ENGINE = ReplacingMergeTree(load_dt)
PARTITION BY (load_dt)
ORDER BY (hk_product_id);
