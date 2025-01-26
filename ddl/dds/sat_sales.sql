DROP TABLE IF EXISTS sys3.sat_sales;

CREATE TABLE sys3.sat_sales
(
    hk_sale_id      UInt64,
    sale_dt         Date,
    load_dt         DateTime,
    source          String
)
ENGINE = ReplacingMergeTree(load_dt)
PARTITION BY (load_dt)
ORDER BY (hk_sale_id);
