class RemoveCommentIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :comment_id, :string
  end
end
