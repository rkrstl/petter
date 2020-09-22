
##usersテーブル

|Column          |Type    | Options     |
|----------------|--------|-------------|
|nickname        |	string|	null:false  |
|password        |	string|	null:false  |
|birth           |	date  |	null:false  |
|e-mail	         |string	|null:false   |

##Association
has_one :my-page
has_many :comments 
has_many :likes
has_many :tweets


my-pagesテーブル
|Column                                | Type     | Options                        |
|--------------------------------------|----------|--------------------------------|
|user                                  |references|null:false,foreign_key:true     |
|introduction                          | text     |null:false                      |        
|bleed_id                              | integer  |null:false                      | 
|pet-name                              | string   |null:false                      |

#Association
belongs_to :user




##petsテーブル

|Column                                | Type     | Options                        |
|--------------------------------------|----------|--------------------------------|
|user                                  |references|null:false,foreign_key:true     |
|birth                                 |	date    |	null:false                     |
|bleed_id                              | integer  |null:false                      |

#Association
belongs_to: user
has_many :likes



##tweetsテーブル
|Column        | Type      |Options                    |
|--------------|-----------|---------------------------|
|title         |string     |null:false                 |
|text          |text       |null:false                 |


belongs_to :user


##commentsテーブル
|Column        | Type      |Options                    |
|--------------|-----------|---------------------------|
|user          |references |null:false,foreign_key:true|
|tweet         |references |null:false,foreign_key:true|
|text          |text       |null:false                 |

#Association
belongs_to:user
belongs_to:tweet


#likesテーブル
|Columns   |Type      |Options                    |
|----------|----------|---------------------------|
|user      |references|null:false,foreign_key:true|
|item      |references|null:false,foreign_key:true|

Association
belongs_to :user
belongs_to :tweet