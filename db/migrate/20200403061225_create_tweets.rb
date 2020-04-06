class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :image, null: false
      t.string :carname, null: false
      t.integer :year, null: false
      t.text :description, null: false
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
