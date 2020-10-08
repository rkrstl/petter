class CreateTweetTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_tag_relations do |t|
      t.references :tweet
      t.references :tweet_tag
      t.timestamps
    end
  end
end
