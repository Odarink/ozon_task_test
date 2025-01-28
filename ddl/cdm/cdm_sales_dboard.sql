CREATE TABLE IF NOT EXISTS sys3.cdm_sales_dboard
(
    дата Date,
    название_товара String,
    название_категории String,
    номер_заказа UInt32,
    сумма_продажи Decimal(18,2),
    стоимость_рекламы Decimal(18,2)
) ENGINE = MergeTree()
PARTITION BY (дата)
ORDER BY (номер_товара);
