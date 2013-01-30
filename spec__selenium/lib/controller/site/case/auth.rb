# encoding: utf-8

##
# Controller
module Controller
  ##
  # Site
  module Site
    ##
    # Case
    module Case
      ##
      # auth
      #
      # @param [Hash] options
      # @option options [Symbol] :browser
      # @option options [String] :username
      # @option options [String] :password
      # @option options [String] :base_url
      # @option options [String] :screenshot
      # @option options [String] :screencast
      #
      # @return [Hash]
      #
      # @example
      #   result = case :browser => :browser
      #                 :username => "username",
      #                 :password => "password",
      #                 :base_url => "http://example.com",
      #                 :screencast => "screenshot.png",
      #                 :screencast => "screencast.mov"
      #   #=> {
      #           :status => true,
      #           :error => nil
      #           :value => :valid, :invalid or :empty
      #       }
      def self.auth options
        begin
          raise ArgumentError if options[:browser].nil? or
              options[:username].nil? or
              options[:password].nil? or
              options[:base_url].nil? or
              options[:screenshot].nil? or
              options[:screencast].nil?

          # Headless
          #headless = Headless.new
          #headless.start
          #headless.video.start_capture

          # Selenium::WebDriver
          driver = Selenium::WebDriver.for options[:browser]

          # Selenium::WebDriver::Wait
          wait = Selenium::WebDriver::Wait.new

          result = Controller::Site.auth :driver => driver,
                                         :wait => wait,
                                         :username => options[:username],
                                         :password => options[:password],
                                         :base_url => options[:base_url]
          raise result[:error] if !result[:status]

          result = {
              :status => true,
              :error => nil,
              :value => result[:value]
          }

          # Stop and discard video
          #headless.video.stop_and_discard

          # Close Selenium::WebDriver
          driver.close

          # Close Headless
          #headless.destroy

          return result
        rescue Exception => exception
          result = {
              :status => false,
              :error => exception.message,
              :value => nil
          }

          # Save screencast and screenshot
          #defined = defined? headless
          #headless.take_screenshot options[:screenshot] if !defined.nil?
          #headless.video.stop_and_save options[:screencast] if !defined.nil?

          # Close Selenium::WebDriver
          defined = defined? driver
          driver.close if !defined.nil?

          # Close Headless
          #defined = defined? headless
          #headless.destroy if !defined.nil?

          return result
        end
      end
    end
  end
end