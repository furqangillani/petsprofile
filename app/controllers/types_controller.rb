class TypesController < ApplicationController
  before_action :set_type, only: [ :show, :edit, :update, :destroy ]
  before_action :ensure_current_user

  def index
    @types = Type.all
  end

  def show
  end

  def new
    @type = Type.new
  end

  def edit
  end

  def create
    @type = Type.new(type_params)
    @type.user_id = current_user.id
      if @type.save
        redirect_to type_path(@type), notice: "Type was successfully created."
      else
        render 'new'
      end
    end

  def update
      if @type.update(type_params)
        redirect_to type_path(@type), notice: "Type was successfully updated."
      else
        render 'edit'
      end
    end

  def destroy
    @type.destroy

      redirect_to types_path, notice: "Type was successfully destroyed."
    end

  private

    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:name, :description)
    end
end
