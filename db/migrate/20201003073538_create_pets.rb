class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.references :user,null:false,foreign_key:true
      t.string     :pet_name,null:false
      t.integer    :bleed_id,null: false
      t.date       :birth,null:false
      t.integer    :gender_id,null:false
      t.text       :personality 
      t.string     :animal_type
      t.timestamps 
    end
  end
end


