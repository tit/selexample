# encoding: utf-8

##
# Model
module Model
  ##
  # Site
  module Site
    ##
    #  Password
    module Password
      ##
      # Invalid
      module Invalid
        ##
        # get_data
        #
        # @return [Array]
        #
        # @example
        #   result = data
        def self.get_data
          [
              " #{Model::Site.get_data[:password]}",
              "#{Model::Site.get_data[:password]} ",
              " #{Model::Site.get_data[:password]} ",

              "#{Model::Site.get_data[:password].upcase}",
              " #{Model::Site.get_data[:password].upcase}",
              "#{Model::Site.get_data[:password].upcase} ",
              " #{Model::Site.get_data[:password].upcase} ",

              "#{Model::Site.get_data[:password].reverse}",
              " #{Model::Site.get_data[:password].reverse}",
              "#{Model::Site.get_data[:password].reverse} ",
              " #{Model::Site.get_data[:password].reverse} ",

              "#{Model::Site.get_data[:password].reverse.upcase}",
              " #{Model::Site.get_data[:password].reverse.upcase}",
              "#{Model::Site.get_data[:password].reverse.upcase} ",
              " #{Model::Site.get_data[:password].reverse.upcase} ",
          ]
        end
      end
    end
  end
end