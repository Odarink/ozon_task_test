DROP TABLE IF EXISTS sys3.hub_product;

CREATE TABLE sys3.hub_product
(
    hk_product_id  UInt64,
    product_id     UInt32,
    load_dt     DateTime,
    source      String
)
ENGINE = ReplacingMergeTree(load_dt) -- для удаления дублей по строкам
--ENGINE = MergeTree(load_dt)
PARTITION BY toYYYYMM(load_dt)
ORDER BY (hk_product_id, load_dt);
