class GolfcoursesController < ApplicationController
  def new
    @golfcourse = Golfcourse.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    golfcourse = Golfcourse.new(golfcourse_params)
    # データをデータベースに保存するためのsaveメソッド実行
    golfcourse.save
    # 詳細画面へリダイレクト
    redirect_to golfcourse_path(golfcourse.id)
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

   private
  # ストロングパラメータ
  def golfcourse_params
    params.require(:golfcourse).permit(:title, :body, :image)
  end
end
