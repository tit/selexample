# encoding: utf-8

##
# Controller
module Controller
  ##
  # Site
  module Site
    ##
    # auth
    #
    # @param [Hash] options
    # @option options [Selenium::WebDriver::Driver] :driver
    # @option options [Selenium::WebDriver::Wait] :wait
    # @option options [String] :base_url
    # @option options [String] :username
    # @option options [String] :password
    #
    # @return [Hash]
    #
    # @example
    #   driver = Selenium::WebDriver.for :browser
    #   wait = Selenium::WebDriver::Wait.new
    #   result = case :driver => driver,
    #                 :wait => wait,
    #                 :base_url => "http://example.com",
    #                 :username => "username@example.com",
    #                 :password => "password"
    #   #=> {
    #           :status => true,
    #           :error => nil,
    #           :value => :valid, :invalid or :empty
    #       }
    def self.auth options
      begin
        raise ArgumentError if options[:driver].nil? or
            options[:wait].nil? or
            options[:base_url].nil? or
            options[:username].nil? or
            options[:password].nil?

        options[:wait].until do
          options[:driver].get options[:base_url]
        end

        # username
        xpath = '//*[@id="username"]'
        options[:wait].until do
          options[:driver].find_element :xpath, xpath
        end
        element = options[:driver].find_element :xpath, xpath
        element.clear
        element.send_keys options[:username]

        # password
        xpath = '//*[@id="password"]'
        options[:wait].until do
          options[:driver].find_element :xpath, xpath
        end
        element = options[:driver].find_element :xpath, xpath
        element.clear
        element.send_keys options[:password]

        # submit
        xpath = '//*[@id="login"]'
        options[:wait].until do
          options[:driver].find_element :xpath, xpath
        end
        element = options[:driver].find_element :xpath, xpath
        element.click

        ##
        # Get site status
        xpath = '//*[@id="status"]'
        options[:wait].until do
          options[:driver].find_element :xpath, xpath
        end
        element = options[:driver].find_element :xpath, xpath

        value = case element.text
                  when "hi, #{options[:username].downcase}" then
                    :valid
                  when "invalid username or password" then
                    :invalid
                  when "empty username or password" then
                    :empty
                  else
                    raise
                end

        result = {
            :status => true,
            :error => nil,
            :value => value
        }

        return result
      rescue Exception => exception
        result = {
            :status => false,
            :error => exception.message,
            :value => nil
        }

        return result
      end
    end
  end
end