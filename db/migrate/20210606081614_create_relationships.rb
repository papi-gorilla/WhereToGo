class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :following_id
      t.integer :followe_id
      t.timestamps
    end
  end
end
