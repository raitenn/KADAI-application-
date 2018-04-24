class UsersController < ApplicationController
  before_action :authenticate_user!
def edit
	@user = User.find(params[:id])
end
def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    redirect_to books_path
	    flash[:notice] = "User was successfully update."
	end

	def index
      @users = User.all
      @book = Book.new
  	end

  	def show
  		@user = User.find(params[:id])
  		@book = Book.new
      @users = User.all
  	end
private

    def user_params
        params.require(:user).permit(:name, :image, :introduction)
    end
end
