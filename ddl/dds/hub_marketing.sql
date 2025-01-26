DROP TABLE IF EXISTS sys3.hub_marketing;

CREATE TABLE sys3.hub_marketing
(
    hk_marketing_id  UInt64,   -- Хэш-ключ рекламного вложения
    ad_dt               Date,     -- Дата рекламного вложения (часть BK)
    product_id          UInt32,   -- Номер товара (бизнес-ключ)
    load_dt             DateTime, -- Дата загрузки записи в хаб
    source              String    -- Источник данных
)
ENGINE = ReplacingMergeTree(load_dt)
PARTITION BY (load_dt)
ORDER BY (hk_marketing_id);