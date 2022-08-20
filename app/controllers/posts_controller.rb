class PostsController < ApplicationController
  before_action :set_post, only: [ :edit, :update, :destroy ]

  def index
    @posts = current_user.posts
    @service = current_user.services.limit(5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to post_path(@post), notice: "Post was successfully created."
      else
        render 'new'
      end
  end

  def update
      if @post.update(post_params)
        redirect_to post_path(@post), notice: "Post was successfully updated."
      else
        render 'edit'
      end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_user.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, pictures: [])
    end
end
