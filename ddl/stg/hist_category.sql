CREATE TABLE IF NOT EXISTS sys3.hist_category
(
    номер_товара UInt64,
    название_товара String,
    номер_категории UInt32,
    название_категории String,
    load_dt DateTime
) ENGINE = MergeTree()
ORDER BY номер_товара;
