class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text   :content
      t.date :start_time
      t.string   :tag
      
      t.timestamps
    end
  end
end
