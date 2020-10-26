
##usersテーブル

|Column          |Type    | Options     |
|----------------|--------|-------------|
|nickname        |	string|	null:false  |
|password        |	string|	null:false  |
|birth           |	date  |	null:false  |
|e-mail	         |string	|null:false   |
|introduction    | text   |null:false   |        


##Association
has_many :comments 
has_many :likes
has_many :tweets
has_many :pets
has_many :relationships
has_many :followings, through: :relationships, source: :follow
has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
has_many :followers, through: :reverse_of_relationships, source: :user






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
|tweet     |references|null:false,foreign_key:true|

Association
belongs_to :user
belongs_to :tweet


#relationshipsテーブル
|Columns   |Type      | Options                       |
|----------|----------|-------------------------------|
|user      |references|null:false foreign_key: true   |
|follow    |references|null:false foreign_key: true   |


belongs_to :user
belongs_to :follow,class_name: 'User'


#petsテーブル
|Columns    |Type      | Options                        |
|-----------|----------|--------------------------------|
|user       |references|null:false,foreign_key:true     |
|pet_name   |string    |null:false                      |
|bleed_id   |integer   |null: false                     |
|birth      |date      |                                |
|gender_id  |integer   |null: false                     |     |
|personality|text      |null: false                     |


belongs_to :user

