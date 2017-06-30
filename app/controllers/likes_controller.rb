class LikesController < ApplicationController
  def index
    json_response({message: "hello", current_user: @current_user})
  end
end
