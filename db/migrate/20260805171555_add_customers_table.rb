class AddCustomersTable < ActiveRecord::Migration[7.2]
  
  def change
  
    create_table :customers do |t|
      t.text :name, null: false
      t.integer :age, null: false
      t.integer :pincode, null: false

      t.timestamps
    end
  
  end

end
