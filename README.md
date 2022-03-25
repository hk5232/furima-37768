## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :buys

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category_id | integer    | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| status_id   | integer    | null: false                    |
| cost_id     | integer    | null: false                    |
| source_id   | integer    | null: false                    |
| shipment_id | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :buy

## buysテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| source_id	       | integer    | null: false                    |
| address_city     | string     | null: false                    |
| address_street   | string     | null: false                    |
| address_building | string     |                                |
| phone_number     | string     | null: false                    |
| buy_id           | references | null: false, foreign_key: true |


### Association
- belongs_to :buy
