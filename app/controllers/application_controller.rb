class ApplicationController < ActionController::Base
  #before_action :authenticate_customer!,except: [:top, :about, :index, :show]

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,
    :last_name_kana, :first_name_kana, :postal_code, :registered_address, :telephone_number])
  end

end
