# テーブル設計

## users テーブル

| Column         | Type       | Options      |
| -------------- | ---------- | -------------|
| name           | string     |  null: false |
| first_name     | string     |  null: false |
| first_name_kana| string     |  null: false |
| last_name      | string     |  null: false |
| last_name_kana | string     |  null: false |
| birthday       | date       |  null: false |
| email          | string     |  null: false, unique:true |
| encrypted_password       | string     |  null:false  |

### Association

- has_many :items
- has_many :logs

## items テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| -------------------------------|
| item_name       | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| introduction    | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| shipping_cost_id| integer    | null: false                    |
| destination_id  | integer    | null: false                    |
| date_id         | integer    | null: false                    |
| price           | integer    | null: false                    |


### Association

- belongs_to :user
- has_one    :log

## logs テーブル

| Column | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## shippings テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | -------------------------------|
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_number| string     | 　　　　　　　                    |
| tell           | string     | null: false                    |
| log            | references | null: false, foreign_key: true |

### Association

- belongs_to : log