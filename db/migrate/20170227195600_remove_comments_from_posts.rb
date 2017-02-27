class RemoveCommentsFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :comments, :string
  end
end
