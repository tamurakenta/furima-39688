# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |   
| email              | string | null: false               |
| encrypted_password | string | null: false               |  
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | string | null: false               |

### Association

- has_many :items
- has_many :buy_item_info, through: :shipping_address
- has_many :buy_item_info


## items テーブル

| Column                  | Type       | Options                        |
| ----------              | ---------- | ------------------------------ |
| item_image              | string     | null: false                    |
| item_name               | string     | null: false                    |
| item_info               | text       | null: false                    |
| item_category           | string     | null: false                    |
| item_sales_status       | string     | null: false                    |
| item_shipping           | string     | null: false                    |
| item_prefecture         | string     | null: false                    |
| item_scheduled_delivery | string     | null: false                    |
| item_price              | references | null: false, foreign_key: true |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :shipping_address


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

- belongs_to :items
- belongs_to :buy_item_info


## buy_item_info テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| number_inform | string     | null: false                    |
| expiry_form   | string     | null: false                    |
| cvc_form      | string     | null: false                    |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :shipping_address
- belongs_to :users
