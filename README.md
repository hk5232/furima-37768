## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| lastName           | string | null: false               |
| firstName          | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :address
- has_many :buys

## itemsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| category | text       | null: false                    |
| price    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |
| status   | string     | null: false                    |
| load     | string     | null: false                    |
| region   | string     | null: false                    |
| shipment | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :buys

## buysテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user

## addressテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postalCode       | integer    | null: false                    |
| state            | string     | null: false                    |
| address_city     | string     | null: false                    |
| address_street   | string     | null: false                    |
| address_building | string     |                                |
| phoneNumber      | integer    | null: false                    |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :buy
- belongs_to :user
