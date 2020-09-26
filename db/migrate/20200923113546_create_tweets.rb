class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :user,null:false,foreign_key: true
      t.string :title,null:false
      t.text :text,null:false
      t.integer :likes_count

      t.timestamps
    end
  end
end
