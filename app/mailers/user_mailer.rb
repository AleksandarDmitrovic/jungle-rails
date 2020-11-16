class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def recepit_email(order, products)
    @order = order
    @products = products

    mail(to: @order.email, subject: "Thank you for your order Order#:#{order.id}")
  end
end
