class AddStatusToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :status, :boolean, default: true
  end
end
