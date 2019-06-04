class CreateInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :interactions do |t|
      t.integer :contact_id
      t.text :details
      t.date :date

      t.timestamps
    end
  end
end
