class CreateTweetTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_tags do |t|
      t.string :name, null:false, uniqueness: true
      t.timestamps  
    end
  end
end
