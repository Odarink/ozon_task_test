CREATE TABLE IF NOT EXISTS sys3.stg_marketing
(
    номер_товара UInt64,
    дата Date,
    стоимость_рекламы Decimal(18,2)
) ENGINE = MergeTree()
PARTITION BY toYYYYMM(дата)
ORDER BY (номер_товара, дата);