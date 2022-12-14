class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: 'index')
    else
      redirect_to new_post_path
    end
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:content, :parent_id)
          .merge(post_id: params[:post_id])
  end

end
