class AddMypageToPostImages < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :mypage, :string
  end
end
