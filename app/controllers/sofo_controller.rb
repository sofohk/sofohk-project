class SofoController < ApplicationController
  before_filter :base_record
  
  def back
    uri = session[:original_uri]
    session[:original_uri] = nil
    redirect_to(uri || { :action => "index" })
  end
  
protected
  def base_record
  end
  
end