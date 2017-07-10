module UpdateHelper
  def update_user_with_params(user, params)
    json_response({message: "You can only update your own account."}) unless user.username == params[:username]
    _update_obj_with_params(user, params)
  end

  def update_transaction_with_params(object, params)
    # TODO: needs authorization check on both sides
  end

  def _update_obj_with_params(obj, params)
    params.each do |key, val|
      next if val == nil
      obj.update(key, val)
    end
  end
end
