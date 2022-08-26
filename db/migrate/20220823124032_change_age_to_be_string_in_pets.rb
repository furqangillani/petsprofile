class ChangeAgeToBeStringInPets < ActiveRecord::Migration[7.0]
  def change
    change_column :pets, :age, :string
  end
end
