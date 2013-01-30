# encoding: utf-8

##
# Model
module Model
  ##
  # Site
  module Site
    ##
    # get_data
    #
    # @return [Hash]
    #
    # @example
    #   result = data
    def self.get_data
      base_urls = %w(
          http://localhost
          http://78.47.163.158:81
      )
      {
          :base_url => base_urls[0],

          # real username
          :username => "u$er",
          # real password
          :password => "pa$$word"
      }
    end
  end
end