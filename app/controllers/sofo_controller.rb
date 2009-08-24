class SofoController < ApplicationController
  before_filter :save_orginal_uri
  
  def back
    uri = session[:original_uri]
    session[:original_uri] = nil
    redirect_to(uri || { :action => "index" })
  end
  
protected
  def save_orginal_uri
    if not session[:original_uri]
    session[:original_uri] = request.request_uri
    end
  end
  
end