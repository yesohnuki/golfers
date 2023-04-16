class PostCommentsController < ApplicationController

  def create
    @golfcourse = Golfcourse.find(params[:golfcourse_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.golfcourse_id = @golfcourse.id
    if @post_comment.save
      #redirect_to golfcourse_path(@golfcourse) 非同期通信化
    else
      render 'golfcourses/show'
    end
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    @golfcourse = Golfcourse.find(post_comment.golfcourse_id)
    post_comment.destroy
    #redirect_to golfcourse_path(params[:golfcourse_id]) 非同期通信化
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
