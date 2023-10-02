class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    # @book = Book.new(title: params[:title], body: params[:body])
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash.now[:alart] = @book.errors.full_messages
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  # ----------プライベートメソッド----------
  private
  # ストロングパラメータ設定
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
