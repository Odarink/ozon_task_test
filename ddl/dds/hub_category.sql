DROP TABLE IF EXISTS sys3.hub_category;

CREATE TABLE sys3.hub_category
(
    hk_category_id  UInt64,
    category_id     UInt32
    load_dt     DateTime,
    source      String
)
ENGINE = ReplacingMergeTree(load_dt) -- для удаления дублей по строкам
--ENGINE = MergeTree(load_dt)
PARTITION BY (load_dt)
ORDER BY (hk_category_id);
