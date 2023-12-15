class BooksController < ApplicationController

  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
       #データをデータベースに保存するためのsaveメソッド実行
      if @book.save
      #フラッシュメッセージを表示させる
      flash[:notice] = "Book was successfully created."
      #show画面へリダイレクト
      redirect_to book_path(@book)
      else
      # フラッシュメッセージを定義し、index.html.erbを描画する
      flash.now[:notice] = "投稿に失敗しました。"
      render :new
      end
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
    # showへリダイレクト
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
    #データを受け取る（一件）
    @book = Book.find(params[:id])
    #データを変更
    @book.update(book_params)
    # 投稿一覧画面へリダイレクト*なぜidがこの表記になるのかわからない
    if @book.save
    #フラッシュメッセージを表示させる
    flash[:notice] = "Book was successfully created."
    #show画面へリダイレクト
    redirect_to book_path(id: @book.id)
    else
    # フラッシュメッセージを定義し、index.html.erbを描画する
    flash.now[:notice] = "投稿に失敗しました。"
    render :edit
    end
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
