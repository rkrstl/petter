class Pet < ApplicationRecord

belongs_to :user
has_one_attached :image



extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :bleed
  belongs_to_active_hash :gender
  

validates :bleed_id,presence: true
validates :personality,presence: true
end
