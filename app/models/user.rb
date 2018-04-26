class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         attachment :image
	has_many :books
       validates :name,length: { in: 2..20 } 
       validates :introduction,length: { maximum: 50 } 
       validates :name, presence: true

       def current_user?(user)
    user == current_user
  end
  
end
