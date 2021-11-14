class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end


  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    customer.updated_at = Time.now()

    if customer.update(customer_params)
      redirect_to customers_mypage_path

    else
      redirect_to about_path
    end
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)

  end

  def withdraw
    current_customer.update(is_active: false)

    reset_session

    redirect_to root_path
  end

  # # def withdraw
  # #  customer = Customer.find(current_customer.id)
  #   # update_time = Time.now()

  #   if customer.update(is_active: false)

  #     redirect_to customers_mypage_path

  #   else
  #     redirect_to edit_customers_path

  #   end
  # end


  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
      :postal_code, :address, :telephone_number, :email, :is_active)
    end

end
