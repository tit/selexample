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
      # Empty
      module Empty
        ##
        # get_data
        #
        # @return [Array]
        #
        # @example
        #   result = data
        def self.get_data
          %W(
          #{Model::Site.get_data[:username].clear}
          )
        end
      end
    end
  end
end