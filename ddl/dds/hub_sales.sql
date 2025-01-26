DROP TABLE IF EXISTS sys3.hub_sales;

CREATE TABLE sys3.hub_sales
(
    hk_sale_id  UInt64,
    sale_id     UInt32,
    load_dt     DateTime,
    source      String
)
ENGINE = ReplacingMergeTree(load_dt) -- для удаления дублей по строкам
--ENGINE = MergeTree(load_dt)
PARTITION BY toYYYYMM(load_dt)
ORDER BY (hk_sale_id, load_dt);
