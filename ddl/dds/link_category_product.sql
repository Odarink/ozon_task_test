drop table if exists sys3.link_category_product;

create table sys3.link_category_product
(
hk_link_category_product    UInt64 primary key,
hk_category_id              UInt64 not null CONSTRAINT fk_link_category_product_category REFERENCES sys3.hub_category (hk_category_id),
hk_product_id               UInt64 not null CONSTRAINT fk_link_category_product_product REFERENCES sys3.hub_product (hk_product_id),
load_dt                     DateTime,
source                      String
)

ENGINE = ReplacingMergeTree(load_dt)
PARTITION BY (load_dt)
order by hk_link_category_product;