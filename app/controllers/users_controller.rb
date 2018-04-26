class UsersController < ApplicationController
  before_action :authenticate_user!

def edit
	@user = User.find(params[:id])
  if @user.id == current_user.id
  else 
    redirect_to user_path(@user)
  end
end

def update
	    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "ユーザ登録情報更新"
        redirect_to user_path
      else
        render 'edit' and return
      end
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
