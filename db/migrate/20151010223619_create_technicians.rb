class CreateTechnicians < ActiveRecord::Migration
  def change
    create_table :technicians do |t|
      t.string :first_name
      t.string :last_name
      t.integer :profession
      t.string :area
      t.integer :city
      t.string :phone_number
      t.integer :language
      t.string :pincode

      t.timestamps null: false
    end
  end
end
