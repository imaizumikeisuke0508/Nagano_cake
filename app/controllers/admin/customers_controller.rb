class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
    @customers.each do |customer|
    if customer.is_deleted == false
      @status = "有効"
    else
      @status = "退会"
    end
   end
  end


  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(params[:id])
  end
   private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end
