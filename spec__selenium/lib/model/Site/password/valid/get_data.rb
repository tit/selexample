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
          #{Model::Site.get_data[:password]}
          )
        end
      end
    end
  end
end