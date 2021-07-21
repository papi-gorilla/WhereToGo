class AddWayToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :way, :string
  end
end
