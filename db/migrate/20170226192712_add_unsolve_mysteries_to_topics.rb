class AddUnsolveMysteriesToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :unsolve_mysteries, :string
  end
end
