# encoding: utf-8

require "rubygems"
require "rspec"
require "rack/test"

require "app.rb"

describe "selexamle" do
  include Rack::Test::Methods

  ##
  # app
  #
  # @return [Class]
  #
  # @example
  #   result = app
  #   #=> Sinatra::Application
  def app
    Sinatra::Application
  end

  it "should 200 /" do
    get "/"
    200 == last_response.status.should
  end

  it "should 200 /status" do
    post "/status", :username => "", :password => ""
    200 == last_response.status.should
  end

  it "should 500 /status" do
    post "/status"
    500 == last_response.status.should
  end

  it "should 404 /404" do
    get "/404"
    404 == last_response.status.should
  end
end