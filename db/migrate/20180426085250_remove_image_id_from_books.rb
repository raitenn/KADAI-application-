class RemoveImageIdFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :image_id, :string
  end
end
