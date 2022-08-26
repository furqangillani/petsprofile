class AddUserToTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :types, :user, null: false, foreign_key: true
  end
end
