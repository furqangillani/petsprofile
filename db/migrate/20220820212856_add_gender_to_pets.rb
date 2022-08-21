class AddGenderToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :gender, :string
    add_column :pets, :description, :string
  end
end
