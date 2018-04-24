class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
end

 def after_sign_in_path_for(resource)
      home_mypage_path
 end

  private

  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
	    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
    end



end