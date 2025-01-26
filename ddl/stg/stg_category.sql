-- Справочник товаров и категорий (product_category_stg)
CREATE TABLE IF NOT EXISTS sys3.stg_category
(
    номер_товара UInt64,
    название_товара String,
    номер_категории UInt32,
    название_категории String
) ENGINE = MergeTree()
ORDER BY номер_товара;
