class AdminController < ApplicationController
  def login
    clear_session
    if request.post?
      user = User.authenticate(params[:loginname], params[:password])
      if user
        session[:user_loginname] = user.loginname
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => "index" })
      else
        flash[:notice] = "Invalid user/password combination"
      end
    else
      #flash.now[:notice] = session[:original_uri]
    end
  end

  def logout
    clear_session
    redirect_to(:controller => "home", :action => "index" )
  end
  
  def register
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(:controller => "home", :action => "index") }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "register" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
private 
  def clear_session
    session[:user_id] = nil
    session[:user_loginname] = nil
  end
  
end
