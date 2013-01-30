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
      # Valid
      module Valid
        ##
        # get_data
        #
        # @return [Array]
        #
        # @example
        #   result = data
        def self.get_data
          %W(
          #{Model::Site.get_data[:username]}
          #{Model::Site.get_data[:username].upcase}
          )
        end
      end
    end
  end
end