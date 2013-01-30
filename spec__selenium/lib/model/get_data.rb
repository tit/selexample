# encoding: utf-8

##
# Model
module Model
  ##
  # get_data
  #
  # @return [Hash]
  #
  # @example
  #   result = data
  def self.get_data
    {
        # browser can be :chrome, :firefox, :ff or :android
        :browser => :chrome,
        :screencast => "screencast.mov",
        :screenshot => "screenshot.png",
    }
  end
end