class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.integer :technician
      t.string :summary
      t.string :landmark
      t.string :area
      t.integer :city
      t.datetime :time
      t.string :pincode
      t.date :date
      t.integer :language

      t.timestamps null: false
    end
  end
end
