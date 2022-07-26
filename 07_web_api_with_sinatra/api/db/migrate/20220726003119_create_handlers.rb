class CreateHandlers < ActiveRecord::Migration[6.1]
  def change
    create_table :handlers do |t|
      t.string :email
      t.integer :phone
      t.string :name
    end
    
  end
end