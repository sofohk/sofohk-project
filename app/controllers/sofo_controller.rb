class SofoController < ApplicationController
  before_filter :save_original_uri
  
  def back
  end
  
protected
  def save_original_uri
    session[:original_uri] = request.request_uri
  end
  
end