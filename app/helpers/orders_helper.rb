module OrdersHelper
  def orders_count
    current_user.orders.count
  end
end
