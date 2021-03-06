# Jungle

Jungle is a mini e-commerce application built with Rails 4.2 for learning Rails by example. 

Its main features include user registration and login, admin authentication for creating new categories and products, and purchases with [Stripe API](https://stripe.com/docs/api).

## Screenshots

Main Store

![Main store](https://github.com/anacko/jungle-rails/blob/master/docs/Store.png)

Admin Access

![Admin Products](https://github.com/anacko/jungle-rails/blob/master/docs/Admin_all_prods.png)

Order Placement

![Stripe Ok](https://github.com/anacko/jungle-rails/blob/master/docs/Cart-Pmt.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
