# encoding: utf-8

get "/" do
  slim :auth
end

post "/status" do
  model = {
      :username => "u$er",
      :password => "pa$$word"
  }

  username = case params[:username].downcase
               when model[:username] then
                 :valid
               when "" then
                 :empty
               else
                 :invalid
             end

  password = case params[:password]
               when model[:password] then
                 :valid
               when "" then
                 :empty
               else
                 :invalid
             end

  @item = "hi, #{model[:username]}" if :valid == username and
      :valid == password

  @item = "invalid username or password" if :invalid == username or
      :invalid == password

  @item = "empty username or password" if :empty == username or
      :empty == password

  slim :status
end