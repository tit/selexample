# encoding: utf-8

require "rubygems"
require "rspec"

require "selexample"

##
# auth
#
# @param [Hash] options
# @option options [String] :it
# @option options [Array] :usernames
# @option options [Array] :passwords
# @option options [Symbol] :status
#
# @return [Hash]
#
# @example
#   options = :it => "it",
#             :usernames => [
#                               "username"
#                           ],
#             :passwords => [
#                               "password"
#                           ],
#             :code => :status,
#   result = auth options
#
#   #=> {
#           :status => true,
#           :error => nil,
#           :value => :status
#       }
def auth options
  raise ArgumentError if options[:it].nil? or
      options[:usernames].nil? or
      options[:passwords].nil? or
      options[:status].nil?

  options[:usernames].each do |username|
    options[:passwords].each do |password|
      describe "site auth" do
        it "it => #{options[:it]},
            username => \"#{username}\",
            password => \"#{password}\"" do
          result = Controller::Site::Case.auth :username => username,
                                               :password => password,
                                               :browser => Model.get_data[:browser],
                                               :base_url => Model::Site.get_data[:base_url],
                                               :screenshot => Model.get_data[:screenshot],
                                               :screencast => Model.get_data[:screencast]
          result.should == {
              :status => true,
              :error => nil,
              :value => options[:status]
          }
        end
      end
    end
  end
end

options = [
    {
        :it => "valid username and valid password",
        :usernames => Model::Site::Username::Valid.get_data,
        :passwords => Model::Site::Password::Valid.get_data,
        :status => :valid
    },
    {
        :it => "valid username and invalid password",
        :usernames => Model::Site::Username::Valid.get_data,
        :passwords => Model::Site::Password::Invalid.get_data,
        :status => :invalid
    },
    {
        :it => "valid username and empty password",
        :usernames => Model::Site::Username::Valid.get_data,
        :passwords => Model::Site::Password::Empty.get_data,
        :status => :empty
    },
    {
        :it => "invalid username and valid password",
        :usernames => Model::Site::Username::Invalid.get_data,
        :passwords => Model::Site::Password::Valid.get_data,
        :status => :invalid
    },
    {
        :it => "invalid username and invalid password",
        :usernames => Model::Site::Username::Invalid.get_data,
        :passwords => Model::Site::Password::Invalid.get_data,
        :status => :invalid

    },
    {
        :it => "invalid username and empty password",
        :usernames => Model::Site::Username::Invalid.get_data,
        :passwords => Model::Site::Password::Empty.get_data,
        :status => :empty
    },
    {
        :it => "empty username and valid password",
        :usernames => Model::Site::Username::Empty.get_data,
        :passwords => Model::Site::Password::Valid.get_data,
        :status => :empty
    },
    {
        :it => "empty username and invalid password",
        :usernames => Model::Site::Username::Empty.get_data,
        :passwords => Model::Site::Password::Invalid.get_data,
        :status => :empty
    },
    {
        :it => "empty username and empty password",
        :usernames => Model::Site::Username::Empty.get_data,
        :passwords => Model::Site::Password::Empty.get_data,
        :status => :empty
    }
]

options.each do |option|
  auth :it => option[:it],
       :usernames => option[:usernames],
       :passwords => option[:passwords],
       :status => option[:status]
end