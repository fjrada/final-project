class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :owner_id
      t.integer :relative_id
      t.string :nature

      t.timestamps
    end
  end
end
