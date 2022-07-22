class AddColumnToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :fav_snack, :string
  end
end
