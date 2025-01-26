DROP TABLE IF EXISTS sys3.sat_category_product;

CREATE TABLE sys3.sat_category_product
(
    hk_link_category_product    UInt64,
    date_from                   DateTime,
    date_to                     DateTime,
    load_dt                     DateTime,
    source                      String
)
ENGINE = ReplacingMergeTree(load_dt)
PARTITION BY (load_dt)
ORDER BY (hk_link_category_product, date_from);
