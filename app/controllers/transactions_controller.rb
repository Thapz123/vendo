class TransactionsController < ApplicationController

  def index

  end

  def show
    # get txn by id
    # return txn + likes + comments
  end

  def pay
    user_to_pay = User.find_by(username: params[:username])

  end

  def charge
    user_to_charge = User.find_by(username: params[:username])

  end

  def update
    transaction = Transaction.find_by(id: params[:transaction_id])
    update_transaction_with_params(transaction, transactions_params)
  end

  private

  def transactions_params
    params.permit(:username, :transaction_id. :amount, :memo, :status, :visibility)
  end
end
