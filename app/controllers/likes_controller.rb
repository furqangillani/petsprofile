class LikesController < ApplicationController

    def create
    @like = current_user.likes.new(like_params)
    if @like.save
      redirect_back(fallback_location: 'index')
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    likeable = @like.likeable
    @like.destroy
    redirect_back(fallback_location: 'index')
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end

end