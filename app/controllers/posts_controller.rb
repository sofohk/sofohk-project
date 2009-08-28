class PostsController < AuthorizedController
  def create
    post = Post.new(params[:post])
    post.good_count = 0
    post.user_id = session[:user_id]

    respond_to do |format|
      if post.save
        flash[:notice] = 'Post was successfully created.'
        uri = session[:original_uri]
        session[:original_uri] = nil
        format.html { redirect_to(uri || { :action => "index" }) }
#        format.html { redirect_to(@post) }
        format.xml  { render :xml => post, :status => :created, :location => post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => post.errors, :status => :unprocessable_entity }
      end
    end
  end
end
