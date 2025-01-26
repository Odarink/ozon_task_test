DROP TABLE IF EXISTS sys3.sat_category;

CREATE TABLE sys3.sat_category
(
    hk_category_id  UInt64,
    category_name   String,
    load_dt         DateTime,
    source          String
)
ENGINE = ReplacingMergeTree(load_dt)
PARTITION BY (load_dt)
ORDER BY (hk_category_id);
