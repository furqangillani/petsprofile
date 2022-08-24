class AddTypeIdToPets < ActiveRecord::Migration[7.0]
  def change
    add_reference :pets, :type, null: false, foreign_key: true
  end
end
