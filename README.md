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
- has_many :orders

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
| shipping_date_id| integer    | null: false                    |
| price           | integer    | null: false                    |


### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | -------------------------------|
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_number| string     |                                |
| tell           | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to : order

## アプリケーション名：
### FURIMA App
## アプリケーション概要：
### フリマアプリ
## URL：
### https://furima-31955.herokuapp.com/
## テスト用出品者アカウント：
### email:sample@sample.com / pass:m123456  Basic認証： ID:admin/Pass:8888
## テスト用購入者アカウント：
### email:sample1@sample.com / pass:s123456
## 購入用カードの番号・期限・セキュリティコード:
### カード番号：4242424242424242 期限：3/30 セキュリティコード：123
## 利用方法：
### メイン画面右下「食材の追加」アイコンをクリックし、管理したい食材情報を記載後、「食材の登録」をクリックして完了です。
## 目指した課題解決：
### 食材の調達をする男女向けに食材の重複購入を防止する事を念頭に開発しました。
## 洗い出した要件：
### ユーザー情報登録機能,登録機能,登録情報詳細機能,登録情報編集機能,削除機能
## 実装した機能についてのGIFと説明：
### 
## 実装予定の機能： 
### 
## データベース設計：
### 
## ローカルでの動作方法：	
### git cloneからローカル動作までに必要な環境とコマンド: ruby 2.6.5p114, Rails 6.0.3.4, yarn 1.22.10, Bundler version 2.1.4