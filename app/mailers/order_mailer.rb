class OrderMailer < ApplicationMailer
  def order_email(order)
    @order = order
    @url = "http://example.com/login"
    mail(to: @order.email, subject: "Your order #{@order.id} has been placed.")
  end
end
