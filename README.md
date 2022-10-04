#テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| lase_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments
----------------------------

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | text       | null: false                    |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| category     | integer    | null: false                    |
| status       | integer    | null: false                    |
| shipping_fee | integer    | null: false                    |
| send_from    | integer    | null: false                    |
| days_to_ship | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_one :order
- has_many :comments
- belongs_to :user
----------------------------

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       |                                |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
----------------------------

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
----------------------------

## cards テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_num      | integer    | null: false                    |
| expire_date   | date       | null: false                    |
| security_code | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
----------------------------

## destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| country       | integer    | null: false                    |
| city          | string     | null: false                    |
| banchi        | string     | null: false                    |  
| building_name | string     |                                |  
| phone_number  | integer    | null: false                    |  
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

