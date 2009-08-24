class AdminController < SofoController
  def login
    clear_session
    if request.post?
      user = User.authenticate(params[:loginname], params[:password])
      if user
        session[:user_name] = user.loginname
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => "index" })
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    else
      #flash.now[:notice] = session[:original_uri]
    end
  end

  def logout
    session[:user_name] = nil
    redirect_to(:controller => "board", :action => "index" )
  end
  
private 
  def clear_session
    session[:user_id] = nil
    session[:user_loginname] = nil
  end
  
end
