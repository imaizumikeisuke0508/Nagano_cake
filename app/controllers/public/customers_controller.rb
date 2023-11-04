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
    @customer = current_customer
    @customer.update(customers_params)
    redirect_to mypage_path
  end

  private
def customers_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
end

end
