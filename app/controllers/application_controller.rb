class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }

  # def change_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
    
  #   respond_to do |format|
  #     format.js { render inline: "location.reload();" }
  #     format.json { render json: { ok: 'ok' } }
  #     format.html { redirect_back and return }
  #   end
  # end

  # # GET /application/cities
  # def cities
  #   render json: { cities: City.where("name LIKE ?", "%#{params[:q]}%").limit(10) }
  # end

  # protected

  # rescue_from CanCan::AccessDenied do |exception|
  #   render text: "Access Denied", status: :unauthorized
  # end

  # # Override the sign_out redirect path method
  # def after_sign_out_path_for(resource)
  #   new_user_session_path
  # end

  # # Override the sign_in redirect path method
  # def after_sign_in_path_for(resource)
  #   if resource.is_super_admin?
  #     super_admin_dashboard_path
  #   elsif resource.company.is_active && resource.is_active
  #     resource.sign_in_count == 1 && resource.is_owner? ? (company_path + "#/settings") : company_path
  #   else
  #     flash[:notice], flash[:alert] = nil, (current_user.is_owner? ? t('errors.account_disabled_for_payment') : t('errors.account_disabled_by_admin'))
  #     sign_out resource
  #     new_user_session_path
  #   end
  # end

  # # Redirect_back
  # def redirect_back
  #   # Attempt to redirect
  #   redirect_to :back
 
  #   # Catch exception and redirect to root
  #   rescue ActionController::RedirectBackError
  #     redirect_to root_path
  # end
end
