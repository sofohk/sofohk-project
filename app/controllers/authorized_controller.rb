
class AuthorizedController < SofoController
  before_filter :authorize, :except => :login
  
protected
  def authorize
    unless User.find_by_loginname(session[:user_loginname])
      redirect_to :controller => :admin, :action => :login
    end
  end
  
end