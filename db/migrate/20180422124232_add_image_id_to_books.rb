class AddImageIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :image_id, :string
  end
end
