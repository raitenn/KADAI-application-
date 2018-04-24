class BooksController < ApplicationController
  before_action :authenticate_user!
	def new
  	@post = Book.new
  end

  def create
        # ストロングパラメーターを使用
         book = Book.new(book_params)
         book.user_id = current_user.id
        # DBへ保存する
         book.save
        # トップ画面へリダイレクト
        redirect_to book_path(book.id)

  end

  def index
  	@books = Book.all
  	@book = Book.new

  end
  
  def show
    @book = Book.find(params[:id])
    @books = Book.new
      @booknew = Book.new
      @users = User.all
	end

  def edit
	    @book = Book.find(params[:id])
      if @book.user == current_user
      else
        redirect_to book_path(@book)
      end
	end

	def update
	    book = Book.find(params[:id])
	    if 
	    book.update(post_params)
	    redirect_to books_path
	    flash[:notice] = "Book was successfully update."
    	end
  end

  def home
      @books = current_user.books  # ここを記述
      @book = Book.new
  end

	def destroy
    book = Book.find(params[:id])
    if
      book.destroy
      redirect_to books_path
      flash[:notice] = "Book was successfully destroyed."
    end
  end

private
	    def book_params
	        params.require(:book).permit(:title, :body)
	    end
end

