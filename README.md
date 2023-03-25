# テーブル設計

## users テーブル

| Column            | Type   | Options                   | 
| ----------------  | ------ | ------------------------- | 
| nickname          | string | null: false               | 
| family_name       | string | null: false               | 
| first_name        | string | null: false               | 
| family_name_kana  | string | null: false               | 
| first_name_kana   | string | null: false               | 
| birth_day         | date   | null: false               | 
| encrypted_password| string | null: false               | 
| email             | string | null: false, unique: true |

### Association

- has_many :items
- has_many :orders


##  items テーブル

| Column            | Type       | Options                        | 
| ----------------- | ---------- | ------------------------------ | 
| name              | string     | null: false                    | 
| description       | text       | null: false                    | 
| category          | integer    | null: false                    | 
| condition         | integer    | null: false                    | 
| shipping_cost     | integer    | null: false                    | 
| prefecture        | integer    | null: false                    | 
| shipping_days     | integer    | null: false                    | 
| price             | integer    | null: false                    | 
| user              | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one    :order


## orders テーブル
| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ | 
| user          | references | null: false, foreign_key: true | 
| item          | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one    :deliver_adresse

## deliver_adresses テーブル
| Column     | Type       | Options                   | 
| ---------- | ------     | ------------------------- | 
| zip_code   | string     | null: false               | 
| prefecture | integer    | null: false               | 
| city       | string     | null: false               | 
| adress1    | string     | null: false               | 
| adress2    | string     |                           | 
| telephone  | string     | null: false,              | 
| order      | references | null: false, unique: true |
### Association

- belongs_to :order