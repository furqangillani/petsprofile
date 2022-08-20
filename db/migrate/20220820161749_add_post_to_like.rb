class AddPostToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, null: true , foreign_key: true
  end
end
