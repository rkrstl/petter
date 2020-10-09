class Plan < ApplicationRecord
 belongs_to  :user
 
 has_many :plan_tag_relations, dependent: :destroy
 has_many :plan_tags, through: :plan_tag_relations
 validates :start_time, presence: true
end
