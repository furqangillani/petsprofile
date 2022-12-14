class OrdersController < ApplicationController
  before_action :set_order, only: [ :show, :edit, :update, :destroy ]
  def index
    @order = Order.new
    @services = Service.all
    @orders = current_user.services.map { |item| item.orders }
  end

  def all_orders
    @order = current_user.orders
  end

  def show
  end

  def user_orders
    @orders = current_user.orders.order(created_at:'desc')
  end

  def new
    @order = Order.new
    @services = Service.all
  end

  def edit
    @services = current_user.services
  end

  def create
    debugger
    @order = current_user.orders.new(order_params)
      if @order.save
        redirect_to order_path(@order), notice: "Order was successfully created."
      else
        render 'new'
      end
    end

  def update
      if @order.update(order_params)
        redirect_to order_path(@order), notice: "Order was successfully updated."
      else
        render 'edit'
      end
    end

  def destroy
    @order.destroy
      redirect_to orders_user_orders_path, notice: "Order was successfully destroyed."
  end

  private
    def set_order
      @order = current_user.orders.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:title, :price, :service_id)
    end
end
