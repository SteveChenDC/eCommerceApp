class StaticPagesController < ApplicationController
	
  def landing_page
  	@featured_product = Product.limit(3)
  end

  def index
  end
end
