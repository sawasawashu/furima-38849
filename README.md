# テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | -----------                    |
| nickname           | string | null: false                    |
| email              | string | null: false, unique_constraint |
| encrypted_password | string | null: false                    |

## Association
-- has_many :items
-- has_many :purchasers

## items テーブル

| Column    | Type       | Options                        |
| ----------| ------     | -----------                    |
| name      | string     | null: false                    |
| category  | string     | null: false                    |
| price     | integer    | null: false                    |
| seller    | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

## Association
-- belongs_to :user
-- has_many   :purchasers

## purchasers テーブル

| Column     | Type       | Options                       |
| -----------| -----------| ------------------------------|
| name       | string     | null: false                   |
| item       | references | null: false,foreign_key: true |
| user       | references | null: false,foreign_key: true |

## Association
-- has_one    :profile
-- belongs_to :user
-- belongs_to :item

## profiles テーブル

| Column     | Type       | Options                       |
| -----------| -----------| ------------------------------|
| address    | string     | null: false                   |
| purchaser  | references | null: false,foreign_key: true |

## Association
-- belongs_to :purchaser