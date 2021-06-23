class RemoveColumnFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :departure_point
    remove_column :posts, :arrival_point
    remove_column :posts, :way_point1
    remove_column :posts, :way_point2
    remove_column :posts, :way_point3
    remove_column :posts, :way_point4
    remove_column :posts, :way_point5
    remove_column :posts, :way_point6
    remove_column :posts, :way_point7
    remove_column :posts, :way_point8
  end
end
