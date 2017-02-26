class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :date
      t.string :subject
      t.text :data
      t.integer :location_id, foreign_key: true
      t.integer :topic_id, foreign_key: true

      t.timestamps
    end
  end
end
