class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :main_contact
      t.string :city
      t.string :job
      t.datetime :birthday
      t.text :note
      t.string :name
      t.string :last_name
      t.string :nickname
      t.string :country_of_origin
      t.integer :category_id

      t.timestamps
    end
  end
end
