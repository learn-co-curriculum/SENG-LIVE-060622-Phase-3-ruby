class AddColumnToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :owner_id, :integer
  end
end
