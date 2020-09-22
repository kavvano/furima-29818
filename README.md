# README


## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birth_year            | string | null: false |
| birth_month           | string | null: false |
| birth_day             | string | null: false |

### Association

- has_many :items

## items テーブル

| Column          | Type   | Options                        |
| --------------- | ------ | ------------------------------ |
| title           | string | null: false                    |
| explanation     | string | null: false                    |
| category_id     | string | null: false                    |
| status_id       | string | null: false                    |
| delivery_fee_id | string | null: false                    |
| area_id         | string | null: false                    |
| days_id         | string | null: false                    |
| price           | string | null: false                    |
| user_id         | string | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy
- has_one_attached : image

## buys テーブル

| Column        | Type   | Options                        |
| ------------- | ------ | ------------------------------ |
| post_num      | string | null: false                    |
| prefecture_id | string | null: false                    |
| city          | string | null: false                    |
| address       | string | null: false                    |
| building      | string |                                |
| cell_num      | string | null: false                    |
| item_id       | string | null: false, foreign_key: true |

### Association

- belongs_to :item