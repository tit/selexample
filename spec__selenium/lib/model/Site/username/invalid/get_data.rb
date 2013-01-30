# encoding: utf-8

##
# Model
module Model
  ##
  # Site
  module Site
    ##
    #  Username
    module Username
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
              "#{Model::Site.get_data[:username].reverse}",
              " #{Model::Site.get_data[:username].reverse}",
              "#{Model::Site.get_data[:username].reverse} ",
              " #{Model::Site.get_data[:username].reverse} ",

              "#{Model::Site.get_data[:username].reverse.upcase}",
              " #{Model::Site.get_data[:username].reverse.upcase}",
              "#{Model::Site.get_data[:username].reverse.upcase} ",
              " #{Model::Site.get_data[:username].reverse.upcase} ",

              " #{Model::Site.get_data[:username]}",
              "#{Model::Site.get_data[:username]} ",
              " #{Model::Site.get_data[:username]} ",

              " #{Model::Site.get_data[:username].upcase}",
              "#{Model::Site.get_data[:username].upcase} ",
              " #{Model::Site.get_data[:username].upcase} "
          ]
        end
      end
    end
  end
end