class AddStatusToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :status, :boolean, default: true
  end
end
