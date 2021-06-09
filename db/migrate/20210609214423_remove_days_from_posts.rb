class RemoveDaysFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :days, :string
  end
end
