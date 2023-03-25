# テーブル設計

## users テーブル

| Column           | Type   | Options                   | 
| ---------------- | ------ | ------------------------- | 
| nickname         | string | null: false               | 
| family_name      | string | null: false               | 
| first_name       | string | null: false               | 
| family_name_kana | string | null: false               | 
| first_name_kana  | string | null: false               | 
| birth_day        | string | null: false               | 
| password         | string | null: false               | 
| email            | string | null: false, unique: true |

### Association

- has_many :items
- has_many :orders


##  items テーブル

| Column            | Type       | Options                        | 
| ----------------- | ---------- | ------------------------------ | 
| name              | string     | null: false                    | 
| description       | text       | null: false                    | 
| category          | string     | null: false                    | 
| condition         | string     | null: false                    | 
| shipping_cost     | string     | null: false                    | 
| sender_prefecture | string     | null: false                    | 
| shipping_days     | string     | null: false                    | 
| price             | integer    | null: false                    | 
| saler_user_id     | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one    :order


## orders テーブル
| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ | 
| buyer_user_id | references | null: false, foreign_key: true | 
| item_id       | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one    :deliver_adresse

## deliver_adresses テーブル
| Column     | Type   | Options                   | 
| ---------- | ------ | ------------------------- | 
| zip_code   | string | null: false               | 
| prefecture | string | null: false               | 
| city       | string | null: false               | 
| adress1    | srting | null: false               | 
| adress2    | string | null: false               | 
| telephone  | string | null: false, unique: true | 

### Association

- belongs_to :order