class BooksController < ApplicationController
  def create
    book = Book.new(book_params) #データを受け取り新規登録するためのインスタンス作成
    book.save#  データをデータベースに保存するためのsaveメソッド実行
    redirect_to book_path(book)#  show画面へリダイレクト
  end

  def index
    #データを受け取る（全て）
    @books = Book.all
    #データを入れる（箱）の作成
    @book = Book.new
  end

  def destroy
    #データを受け取る（一件）
    book = Book.find(params[:id])
    #データを削除
    book.destroy
    # 投稿一覧画面へリダイレクト
    redirect_to books_path
  end

  def show
    #詳細表示
    @book = Book.find(params[:id])
  end

  def edit
    #編集画面へ移動
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(id:book.id)
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
