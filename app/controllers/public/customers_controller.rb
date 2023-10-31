class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def index
  end

  def withdrawal
    @customer = current_customer
    sign_out @customer
    @customer.update(is_deleted: "true")
    redirect_to root_path
  end

  def update

  end

  private


end
