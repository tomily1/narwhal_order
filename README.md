# Narwhal App
[![Build Status](https://travis-ci.com/tomily1/narwhal_order.svg?branch=master)](https://travis-ci.com/tomily1/narwhal_order)

Rails shopify application that list orders that are placed that contain products with the word *"narwhal"* in them.

### Requirements
1. Ruby version 2.6.0
2. Rails 5.2
3. Bundler version 1.17.2


### Technology used
* Language
  1. Ruby
* Framework used
  1. Ruby on Rails
* Development and testing
  1. RSpec Rails
  2. Rubocop

### Setting up
1. clone this respository `git@github.com:tomily1/narwhal_order.git`.
2. Open the cloned directory with `cd narwhal_order`.
3. Run `bundle install` to install dependencies
4. run `cp -v .env.sample .env`
5. copy over your environment credentials to the .env file. i.e set `WEBHOOK_HOST` (your host url, ngrok or Heroku), `SHOPIFY_API_SECRET` and `SHOPIFY_API_KEY`.
5. run the app with `bundle exec rails server`
6. the app will be available on `localhost:3000`


### Live Demonstration

This app is available and hosted on Heroku and it is available here https://narwhal-fera.herokuapp.com/.


![Demo 1](https://github.com/tomily1/narwhal_order/blob/master/narwhal_demo.gif?raw=true)

![Demo 2](https://github.com/tomily1/narwhal_order/blob/master/narwhal_demo2.gif?raw=true)
