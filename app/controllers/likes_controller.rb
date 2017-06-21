class LikesController < ApplicationController
  def index
    json_response({message: "hello", thing: @current_user.username})
  end
end
