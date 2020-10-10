class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.references :user,null:false,foreign_key:true
      t.string     :pet_name,null:false
      t.integer    :bleed_id,null: false
      t.date       :birth,null:false
      t.integer    :gender_id,null:false
      t.text       :personality 
      t.integer     :animal_type_id
      t.integer    :dog_bleed_id
      t.timestamps 
    end
  end
end


