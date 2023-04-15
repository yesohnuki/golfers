class PostCommentsController < ApplicationController

  def create
    @golfcourse = Golfcourse.find(params[:golfcourse_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.golfcourse_id = @golfcourse.id
    if @post_comment.save
      redirect_to golfcourse_path(@golfcourse)
    else
      render 'golfcourses/show'
    end
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
