# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def recepit_email
    order = Order.new(id: 1, email: "kvirani@gmail.com", total_cents: 248375,stripe_charge_id: "ch_1HoFSdJS3zNn7w5dA3iBZJgW")
  
    line_items =  LineItem.where(order_id: order.id)
    products = line_items.map { |line_item| { product: Product.find(line_item.product_id), quantity: line_item.quantity } }
    UserMailer.recepit_email(order, products)
  end
end