class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :breed 
      t.string :name
      t.string :image_url
      t.integer :age
      t.integer :owner_id
    end
  end
end