module ServicesHelper
  def services_count
    current_user.services.count
  end

  def orders_recieved_against_service
    current_user.services.map { |item| item.orders.count }.sum
  end
end
