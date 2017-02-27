class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :topic
      t.string :place
      t.string :subject
      t.string :date
      t.text :data
      t.text :comments

      t.timestamps
    end
  end
end
