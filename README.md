# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

|Column              |Type     |Options                    |
|--------------------|---------|---------------------------|
|nickname            |string   |null: false                |
|family_name         |string   |null: false                |
|given_name          |string   |null: false                |
|family_name_kana    |string   |null: false                |
|given_name_kana     |string   |null: false                |
|email               |string   |null: false, unique: true  |
|encrypted_password  |string   |null: false                |
|birthday            |date     |null: false                |

### Association

- has_many :items
- has_many :orders

## items テーブル

|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|title               |string     |null: false                    |
|text                |text       |null: false                    |
|category_id         |integer    |null: false                    |
|item_status_id      |integer    |null: false                    |
|shipping_cost_id    |integer    |null: false                    |
|prefecture_id       |integer    |null: false                    |
|shipping_date_id    |integer    |null: false                    |
|price               |integer    |null: false                    |
|user                |references |null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

|Column          |Type         |Options                        |
|----------------|-------------|-------------------------------|
|user            |references   |null: false, foreign_key: true |
|order           |references   |null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

|Column          |Type         |Options                        |
|----------------|-------------|-------------------------------|
|postal_code     |string       |null: false                    |
|prefecture_id   |integer      |null: false                    |
|city            |string       |null: false                    |
|block           |string       |null: false                    |
|building        |string       |                               |
|phone_number    |string       |null: false                    |
|order           |references   |null: false, foreign_key: true |

### Association

- belongs_to :order


