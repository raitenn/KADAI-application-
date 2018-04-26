class RemoveMypageFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :mypage, :string
  end
end
