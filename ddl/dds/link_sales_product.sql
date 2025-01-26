drop table if exists sys3.link_sales_product;

create table sys3.link_sales_product
(
hk_link_sale_product        UInt64 primary key,
hk_sale_id                  UInt64 not null CONSTRAINT fk_link_sales_product_sale REFERENCES sys3.hub_sales (hk_sale_id),
hk_product_id               UInt64 not null CONSTRAINT fk_link_sales_product_product REFERENCES sys3.hub_product (hk_product_id),
load_dt                     DateTime,
source                      String
)

ENGINE = ReplacingMergeTree(load_dt)
PARTITION BY (load_dt)
order by hk_link_sale_product;