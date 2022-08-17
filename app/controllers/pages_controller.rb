class PagesController < ApplicationController
  def index
  end

  def show
    @post = Post.all
  end

end
