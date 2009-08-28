class HomeController < SofoController
  def index
    @tags = Product.tag_counts
  end
  
  def tag_products
    @tag = Tag.find_by_name(params[:tag_name])
    @tag.click_count = @tag.click_count + 1
    @tag.save
    @products = Product.find_tagged_with(params[:tag_name])
  end
  
  def product_posts
    session[:original_uri] = request.request_uri
    product = Product.find(params[:id])
    @product = product
    @post = Post.new
    @post.product_id = @product.id
  end
end
