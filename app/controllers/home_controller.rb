class HomeController < SofoController
  def index
    @tags = Product.tag_counts(:order => 'tags.click_count DESC', :limit => 20)
    @Hot_Products = Product.find(:all, :order => 'click_count DESC', :limit => 20)
    @New_Products = Product.find(:all, :order => 'created_at DESC', :limit => 20)
  end
  
  def tag_products
    @tag = Tag.find_by_id(params[:id])
    @tag.click_count = @tag.click_count + 1
    @tag.save
    @products = Product.find_tagged_with(params[:tag_name])
  end
  
  def product_posts
    session[:original_uri] = request.request_uri
    product = Product.find(params[:id])
    product.click_count = product.click_count + 1
    @product = product
    @post = Post.new
    @post.product_id = @product.id
  end
end
