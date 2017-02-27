class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :alias
      t.string :password_digest
      t.integer :comment_id, foreign_key: true

      t.timestamps
    end
  end
end
