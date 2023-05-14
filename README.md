# テーブル設計

## users テーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | -----------                    |
| nickname           | string   | null: false                    |
| email              | string   | null: false, unique: true      |
| encrypted_password | string   | null: false                    |
| last_name          | string   | null: false                    |
| first_name         | string   | null: false                    |
| last_name_kana     | string   | null: false                    |
| first_name_kana    | string   | null: false                    |
| birthday           | date     | null: false                    |

## Association
-- has_many :items
-- has_many :purchasers
-- has_many :comments

## items テーブル

| Column          | Type       | Options                       |
| ----------      | ------     | -----------                   |
| product_name    | string     | null: false                   |
| introduction    | text       | null: false                   |
| category_id     | integer    | null: false                   |
| status_id       | integer    | null: false                   |
| charge_id       | integer    | null: false                   |
| region_id       | integer    | null: false                   |
| delivery_day_id | integer    | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false,foreign_key: true |

## Association
-- belongs_to :user
-- has_one    :purchaser 
-- has_many   :comments

## purchasers テーブル

| Column     | Type       | Options                       |
| -----------| -----------| ------------------------------|
| item       | references | null: false,foreign_key: true |
| user       | references | null: false,foreign_key: true |

## Association
-- has_one    :profile
-- belongs_to :user
-- belongs_to :item

## profiles テーブル

| Column           | Type       | Options                       |
| ---------------- | -----------| ------------------------------|
| postal_code      | string     | null: false                   |
| region_id        | integer    | null: false                   |
| municipality     | string     | null: false                   |
| address          | string     | null: false                   |
| building_name    | string     |                               |
| telephone_number | string     | null: false                   |
| purchaser        | references | null: false,foreign_key: true |

## Association
-- belongs_to :purchaser

## comments テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| comment | text       | null: false                   |
| rate    | float      | null: false                   |
| user    | references | null: false,foreign_key: true |
| item    | references | null: false,foreign_key: true |

## Association
-- belongs_to :user
-- belongs_to :item