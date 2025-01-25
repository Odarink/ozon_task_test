CREATE TABLE IF NOT EXISTS sys3.stg_sales
(
    номер_заказа UInt64,
    номер_товара UInt64,
    дата_продажи Date,
    сумма_продажи Decimal(18,2)
) ENGINE = MergeTree()
PARTITION BY toYYYYMM(дата_продажи)
ORDER BY (номер_товара, дата_продажи);