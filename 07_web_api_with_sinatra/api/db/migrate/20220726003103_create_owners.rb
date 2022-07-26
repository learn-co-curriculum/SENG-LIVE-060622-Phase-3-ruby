class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :email
      t.string :address
      t.integer :phone
      t.string :username
    end
  end
end