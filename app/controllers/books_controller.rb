class BooksController < ApplicationController
  def create
    book = Book.new(book_params) #データを受け取り新規登録するためのインスタンス作成
    book.save#  データをデータベースに保存するためのsaveメソッド実行
    redirect_to book_path(book)#  show画面へリダイレクト
  end

  def index
    @books = Book.all
    @book = Book.new
  end

   #book = @books.find(params[:id])
    #@books.destroy
    #respond_to do |book|
     #wants.html { redirect_to(model_class_names_url) }
      #wants.xml  { head :ok }
    #end
  #end 削除ぺージを後で追加

  def show
    #詳細表示
    @book = Book.find(params[:id])
  end

  def edit
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
