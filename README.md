# README

# アプリケーション概要

フリーマーケットのWebアプリケーションを作成しました。ユーザー登録すると、商品を出品できるようになります。出品した商品は、説明文の追加や価格の変更などの編集や、出品キャンセルのための削除機能などがあります。他のユーザーが出品した商品は、クレジットカードを使用して購入することができます。<br>

# URL

http://54.238.14.246/<br>

### テストユーザー1

Eメール：kavvano@gmail.com<br>パスワード：kavvano30<br>

### テストユーザー1

Eメール：kawano@gmail.com<br>パスワード：kawano30

### 購入用カード情報

番号：4242424242424242<br>期限：2024年3月<br>セキュリティコード：123<br>

# 開発状況

## 開発環境

Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

## 開発期間と平均作業時間

開発期間：9/22〜10/5（14日間）<br>
1日あたりの平均作業時間：8<br>
合計：112時間程度

# 動作確認方法

接続先およびログイン情報については、上記の通りです。<br>
同時に複数の方がログインしている場合に、ログインできない可能性があります。<br>
テストアカウント1でログイン→トップページから出品ボタンクリック→商品情報入力→商品出品<br>
テストアカウント2でログイン→トップページから先ほど出品した商品をクリック→購入画面に進むをクリック→購入情報を入力→商品購入<br>
確認後、ログアウト処理をお願いします。

# 工夫した点

ユーザー登録機能のテストコードを記述する際に、カリキュラムで学んでいないGemを使用したことです。カリキュラムではFactoryBotを生成する際、FakerというGemを使用していました。しかし、今回のアプリでは名前やフリガナを入力する項目があり、日本語の名前を生成できないかなと調べました。そして、GimeiというGemを見つけました。使い方はそんなに難しくありませんでしたが、日本語の名前を生成するという機能を実現することができました。調べて試してみるというエンジニアとして必要なマインドを持って、アプリ制作に取り組めたと思います。

# 苦労した点

商品出品機能実装時、データが保存されないエラーを解決したことです。このエラーは、他のエラーのように「〇〇Error」という表示が出ないため、どこが原因か最初は全くわかりませんでした。そこで、状況を一旦整理し、処理の順番を考えて原因を特定することにしました。まずは、pry-railsを使用してパラメータが問題なく送信されているか、次に、ストロングパラメータで必要なデータを取得できているか、最後に、create!メソッドを使用してバリデーションで弾かれているデータはないか、このような順番で確認し、バリデーションの記述に間違いがあることを見つけました。このエラーを通じて、処理の流れを理解することはもちろんのこと、状況を把握することの重要性を学びました。これからも、エラーが発生した場合は、論理的に考え対処していこうと思います。

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :items
- has_many :links

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| explanation     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| day_id          | integer    | null: false                    |
| price           | integer    | null: false                    |
| sold_out        | boolean    | default: false, null: false    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :link
- has_one_attached : image

## links テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buy

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_num      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| cell_num      | string     | null: false                    |
| link          | references | null: false, foreign_key: true |

### Association

- belongs_to :link