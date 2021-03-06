class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # deviceのコントローラーのときに、下記のメソッドを呼ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    logined_path
  end

  def sign_out_path_for(resource)
    root_path
  end


  protected

    def configure_permitted_parameters
      # sign_inのときに、usernameも許可する
      devise_parameter_sanitizer.for(:sign_in) << :name
      # sign_upのときに、usernameも許可する
      devise_parameter_sanitizer.for(:sign_up) << :name 
      #  account_updateのときに、usernameも許可する
      devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name,:birthday,:univercity,:major,:department,:firstindustry,:secondindustry)}
    end

end
