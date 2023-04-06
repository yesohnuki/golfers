class GolfcoursesController < ApplicationController
  def new
    @golfcourse = Golfcourse.new
  end

  def create
    @golfcourse = Golfcourse.new(golfcourse_params)  # データを受け取り新規登録するためのインスタンス作成
    if @golfcourse.save  # データをデータベースに保存するためのsaveメソッド実行
      redirect_to golfcourse_path(@golfcourse.id)  # 詳細画面へリダイレクト
    else
      render :new
    end
  end

  def index
    @golfcourses = Golfcourse.all
  end

  def show
    @golfcourse = Golfcourse.find(params[:id])
  end

  def edit
    @golfcourse = Golfcourse.find(params[:id])
  end

  def update
    golfcourse = Golfcourse.find(params[:id])
    golfcourse.update(golfcourse_params)
    redirect_to golfcourse_path(golfcourse.id)
  end

  def destroy
    golfcourse = Golfcourse.find(params[:id])  # データ（レコード）を1件取得
    golfcourse.destroy  # データ（レコード）を削除
    redirect_to '/golfcourses'  # 投稿一覧画面へリダイレクト
  end

   private
  # ストロングパラメータ
  def golfcourse_params
    params.require(:golfcourse).permit(:title, :body, :image)
  end
end
