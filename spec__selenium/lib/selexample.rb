# encoding: utf-8

require "rubygems"
require "selenium-webdriver"
#require "headless"

require "model/get_data"
require "model/site/get_data"
require "model/site/username/valid/get_data"
require "model/site/username/invalid/get_data"
require "model/site/username/empty/get_data"
require "model/site/password/valid/get_data"
require "model/site/password/invalid/get_data"
require "model/site/password/empty/get_data"

require "controller/site/auth"
require "controller/site/case/auth"

##
# Support Ruby 1.9.x notation
class String
  ##
  # clear
  # Makes string empty.
  #
  # @return [String]
  #
  # @example
  #   string = "foo"
  #   result = string.clear
  #   #=> ""
  def clear
    self.delete self
  end
end