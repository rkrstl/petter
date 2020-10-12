class Pet < ApplicationRecord

belongs_to :user
has_one_attached :image



extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :bleed
  belongs_to_active_hash :dog_bleed
  belongs_to_active_hash :gender
  belongs_to_active_hash :animal_type
  


  with_options presence: true do
    validates :pet_name
    validates :personality
    validates :birth
    validates :animal_type_id
  end

end
