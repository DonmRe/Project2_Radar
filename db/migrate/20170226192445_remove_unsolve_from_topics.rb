class RemoveUnsolveFromTopics < ActiveRecord::Migration[5.0]
  def change
    remove_column :topics, :unsolve, :string
  end
end
