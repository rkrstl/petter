# petter
ペットを共有したりお世話の管理ができるアプリです。
下記ページで公開中です。
http://petter.website/


## アプリ概要
ペットを共有でき、ペット予定を管理し記録することができるアプリ
作った経緯: 友達が予定を書いて犬との思い出を記録したいと言っていたのでカレンダーで世話等の管理、ツイート投稿、飼い主同士で繋がれる場ができればいいなと思ったことがきっかけです。
主にRuby on Railsで制作しました。

# 開発環境
ruby on rails /javascript/ruby/GitHub/AWS(route53,EC2,S3,VPC)/HTML/CSS


## 機能
- 検索機能（動物別、種類別、名前）：犬猫別、犬猫の種類別、名前で検索することができる機能
- 世話管理機能：カレンダーに簡単にお世話の予定を記入することができる機能
- 投稿機能 : ペットの画像やブログを登録することができる機能
- 画像スライド機能 :投稿時にプレビュー、複数画像が投稿でき、slickを用いてスライド機能を実装
- インクリメンタルサーチ :投稿時につけることができるタグの候補が出てくる機能(js)
- コメント機能:非同期で投稿にコメントすることができる機能
- ランキング機能 :タグと投稿のランキング機能
- フォロー機能 :他のユーザーをフォローすることができる機能
- ペット登録機能:ペットを登録してユーザーページに表示させることでどんなペットを飼っているか表示できる機能
- マイページ機能 :ユーザー情報の編集、いいねした投稿の一覧、投稿した一覧、登録したペットの編集等ができる機能

## 使い方
### 世話管理機能
1. ヘッダーもしくはマイページからカレンダーを選択
2. 予定を作成を選択
3. 予め用意されているお世話の内容のラジオボタンで簡単にペットの予定を登録
### 投稿機能
1. ヘッダーもしくはトップページの投稿を選択
2. タイトルや画像、タグを入力
3. 投稿され、いいねをたくさんもらうとランキングにのることも

## ローカル環境へのインストール方法
※Railsの場合
```
$ git clone https://github.com/rkrstl/petter
$ cd petter
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## その他
現在も開発を継続しており、順次実装予定です。

## 作者
mail to:choiihwa68@gmail.com


# usersテーブル

|Column          |Type    | Options     |
|----------------|--------|-------------|
|nickname        |	string|	null:false  |
|password        |	string|	null:false  |
|birth           |	date  |	null:false  |
|e-mail	         |string	|null:false   |
|introduction    | text   |null:false   |        


### Association
has_many :comments 
has_many :likes
has_many :tweets
has_many :pets
has_many :relationships
has_many :followings, through: :relationships, source: :follow
has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
has_many :followers, through: :reverse_of_relationships, source: :user


# tweetsテーブル
|Column        | Type      |Options                    |
|--------------|-----------|---------------------------|
|user          |references |null:false,foreign_key:true|
|title         |string     |null:false                 |
|text          |text       |null:false                 |


### Association
belongs_to :user
has_many: comments 
has_many :likes


# commentsテーブル
|Column        | Type      |Options                    |
|--------------|-----------|---------------------------|
|user          |references |null:false,foreign_key:true|
|tweet         |references |null:false,foreign_key:true|
|text          |text       |null:false                 |

### Association
belongs_to:user
belongs_to:tweet


# likesテーブル
|Columns   |Type      |Options                    |
|----------|----------|---------------------------|
|user      |references|null:false,foreign_key:true|
|tweet     |references|null:false,foreign_key:true|

### Association
belongs_to :user
belongs_to :tweet


# relationshipsテーブル
|Columns   |Type      | Options                       |
|----------|----------|-------------------------------|
|user      |references|null:false foreign_key: true   |
|follow    |references|null:false foreign_key: true   |

### Association
belongs_to :user
belongs_to :follow,class_name: 'User'


# petsテーブル
|Columns    |Type      | Options                        |
|-----------|----------|--------------------------------|
|user       |references|null:false,foreign_key:true     |
|pet_name   |string    |null:false                      |
|bleed_id   |integer   |null: false                     |
|birth      |date      |                                |
|gender_id  |integer   |null: false                     |     
|personality|text      |null: false                     |

### Association
belongs_to :user

# plansテーブル
|Columns   |Type      | Options                     |
|----------|----------|---------------------------- |
|user      |references|null:false,foreign_key:true  |
|title     |string    |                             |
|content   |text      |                             |
|start_time|date      |                             |
|tag       |string    |null: false                  |

### Association
 belongs_to :user


 # tweet_tagsテーブル

|Columns   |Type      |Options     |
|----------|----------|------------|
|name      |string    |null: false |

### Association
has_many :tweet_tag_relations
has_many :tweets, through: :tweet_tag_relations


# tweet_tag_relationsテーブル

|Columns    |Type      | Options                        |
|-----------|----------|--------------------------------|
|tweet_tag  |references|null:false,foreign_key:true     |
|tweet      |references|null:false,foreign_key:true     |

### Association
belongs_to :tweet
belongs_to :tweet_tag
