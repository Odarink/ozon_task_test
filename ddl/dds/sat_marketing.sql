DROP TABLE IF EXISTS sys3.sat_marketing

CREATE TABLE sys3.sat_marketing
(
    hk_link_marketing           UInt64,
    amount                      Decimal(18, 2),
    load_dt                     DateTime,
    source                      String
)
ENGINE = ReplacingMergeTree(load_dt)
PARTITION BY (load_dt)
ORDER BY (hk_link_marketing);
