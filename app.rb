#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

configure :production do
  # Configure stuff here you'll want to
  # only be run at Heroku at boot

  # TIP:  You can get you database information
  #       from ENV['DATABASE_URI'] (see /env route below)
end

configure :development do
   set :port, 8888
end

# Quick test
get '/' do
  "Hello World #{params[:name]}".strip
end

# Test at <appname>.heroku.com

# You can see all your app specific information this way.
# IMPORTANT! This is a very bad thing to do for a production
# application with sensitive information

# get '/env' do
#   "<pre>" + ENV.inject("") { |s,(k,v)| s << "#{k}=\"#{v}\"\n" } + "</pre>"
# end
