class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
  end

  def show

  end

  def edit

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  # ----------プライベートメソッド----------
  private

  # ストロングパラメータ設定
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
