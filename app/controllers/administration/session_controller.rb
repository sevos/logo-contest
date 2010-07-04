class Administration::SessionController < Administration::ApplicationController
  skip_before_filter :authorize
  
  def create
    session[:password] = params[:password]
    flash[:notice] = "Successfully logged in"
    redirect_to administration_logos_path
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to administration_login_path
  end
end