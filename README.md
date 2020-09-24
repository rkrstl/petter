
##usersテーブル

|Column          |Type    | Options     |
|----------------|--------|-------------|
|nickname        |	string|	null:false  |
|password        |	string|	null:false  |
|birth           |	date  |	null:false  |
|e-mail	         |string	|null:false   |
|introduction    | text   |null:false   |        
|bleed_id        |integer |null:false   |
|pet-name        | string |null:false   |

##Association
has_many :comments 
has_many :likes
has_many :tweets







##tweetsテーブル
|Column        | Type      |Options                    |
|--------------|-----------|---------------------------|
|user          |references |null:false,foreign_key:true|
|title         |string     |null:false                 |
|text          |text       |null:false                 |



belongs_to :user
has_many: comments 
has_many :likes

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