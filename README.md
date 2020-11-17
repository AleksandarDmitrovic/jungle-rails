# Jungle

A mini e-commerce application that was built with Rails 4.2.
A lighthouse lab project to simulate navigating an existing code-base and implementing new features with a new language (Ruby). 
Implemented features without thorough explanations that simulated real-world situations.

Features implemented for Jungle:

-Sold Out Badge: boolean helper function to display badge when inventory 0.
-Admin Categories: Created restful routes for an admin dashboard and the ability to create new categories within the admin namespace.
-User Authentication: Users can signup and login to Jungle - password is encrypted and email is validated to be unique and normalized before entry into the database.
-Enhanced Order Page: The order page contains items, their image, name, description, quantities and line item totals
-Confirmation Email: A receipt email is sent to the user to confirm a purchase with the order number and details.

## Final Product

!["Screenshot of the Product Page"]()
!["Screenshot of Order Confirmation Page"]()

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
