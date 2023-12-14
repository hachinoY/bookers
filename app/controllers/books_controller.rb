class BooksController < ApplicationController
  def new
     # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @books = Book.new
    #@book = Book.all index作り終わった後で追加
  end

  def create
    book = Book.new(book_params) #データを受け取り新規登録するためのインスタンス作成
    book.save#  データをデータベースに保存するためのsaveメソッド実行
    redirect_to '/books/index'#  index画面へリダイレクト
  end
  
  def index
    @books = Book.all
  end
  
   def destroy
    book = @books.find(params[:id])
    @books.destroy
    respond_to do |book|
      wants.html { redirect_to(model_class_names_url) }
      wants.xml  { head :ok }
    end
  end

  def show
  end

  def edit
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
