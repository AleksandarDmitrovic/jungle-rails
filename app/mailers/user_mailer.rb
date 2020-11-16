class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def recepit_email
    @user = params[:user]
    @url = "http://localhost/3000/orders/id"
    mail(to: @user.email, subject: "Thank you for your order (order number)")
  end
end
