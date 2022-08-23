class TypesController < ApplicationController
  before_action :set_type, only: [ :show, :edit, :update, :destroy ]

  def index
    @types = current_user.types
  end

  def show
  end

  def new
    @type = Type.new
  end

  def edit
  end

  def create
    @type = current_user.types.new(type_params)
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
      @type = current_user.types.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:name, :description)
    end
end
