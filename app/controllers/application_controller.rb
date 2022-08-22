class ApplicationController < Sinatra::Base

  # Add this line to se the Content-Type header for all responses
  set :default_content_type, "application/json"

  get '/games' do
    # get all the games from the database
    games = Game.all.order(:title).limit(10) # => [#<Game>, #<Game>, #<Game>]
    # return a JSON response with an array of all the game data
    games.to_json
  end

    # use the :id syntax to create a dynamic route
    get "/games/:id" do
      # Look up the game in the database using its ID
      game = Game.find(params[:id])
      # send a JSON-formatted responses of the game data
      game.to_json(include: { reviews: { include: :user } })
  end

end

=begin
  get "/games" do
    games = Game.all.orders(:title)
    games.to_json
  end
  
  get "/games" do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

  only option => be more selective about which attributes are returned from each model

=end