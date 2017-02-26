class RemoveMysteriesFromTopics < ActiveRecord::Migration[5.0]
  def change
    remove_column :topics, :mysteries, :string
  end
end
