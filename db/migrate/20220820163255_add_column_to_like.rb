class AddColumnToLike < ActiveRecord::Migration[7.0]
  def change
    change_column :likes, :user_id, :bigint, null:true
  end
end
