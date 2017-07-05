class TransactionsController < ApplicationController

  def index

  end

  def show
    # get txn by id
    # return txn + likes + comments
  end

  def pay

  end

  def charge

  end

  def update

  end

  private

  def transactions_params
    params.permit(:username, :transaction_id. :amount, :memo, :status, :visibility)
  end
end
