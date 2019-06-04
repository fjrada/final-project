class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.integer :contact_id
      t.integer :interest_id

      t.timestamps
    end
  end
end
