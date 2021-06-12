class AddColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :departure_point, :string
    add_column :posts, :arrival_point, :string
    add_column :posts, :way_point1, :string
    add_column :posts, :way_point2, :string
    add_column :posts, :way_point3, :string
    add_column :posts, :way_point4, :string
    add_column :posts, :way_point5, :string
    add_column :posts, :way_point6, :string
    add_column :posts, :way_point7, :string
    add_column :posts, :way_point8, :string

  end
end
