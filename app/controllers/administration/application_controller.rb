class Administration::ApplicationController < ::ApplicationController
  before_filter :set_controller_and_action_names, :authorize

  ADMIN_PASSWORD = "eax.pl-sevos"

  private
  def set_controller_and_action_names
    @current_controller = controller_name
    @current_action     = action_name
  end

  protected
  def admin?
    session[:password] == ADMIN_PASSWORD
  end
  helper_method :admin?
  
  def authorize
    unless admin?
      flash[:error] = t("Unatuhorized access")
      redirect_to logos_path
      false
    end    
  end
end
