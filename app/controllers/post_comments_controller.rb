class PostCommentsController < ApplicationController

  def create
    golfcourse = Golfcourse.find(params[:golfcourse_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.golfcourse_id = golfcourse.id
    comment.save
    redirect_to golfcourse_path(golfcourse)
  end

   def destroy
    PostComment.find(params[:id]).destroy
    redirect_to golfcourse_path(params[:golfcourse_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
