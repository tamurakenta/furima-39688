# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |   
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |  
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :orders, through: :shipping_address
- has_many :orders


## items テーブル

| Column                     | Type       | Options                        |
| ----------                 | ---------- | ------------------------------ |
| item_name                  | string     | null: false                    |
| item_info                  | text       | null: false                    |
| item_category_id           | integer    | null: false                    |
| item_sales_status_id       | integer    | null: false                    |
| item_shipping_id           | integer    | null: false                    |
| item_prefecture_id         | integer    | null: false                    |
| item_scheduled_delivery_id | integer    | null: false                    |
| price                      | integer    | null: false                    |
| user                       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :shipping_addresses


## shipping_address テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| phone_number | string     | null: false                    |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one    :order


## order テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address 
