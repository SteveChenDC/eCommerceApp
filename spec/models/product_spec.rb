require 'rails_helper'

describe Product do 

  context "Average rating display 3" do

    before do 
      @product = Product.create(:name => "race bike") #put test content here  
      @user = User.create(:email => "email@yahoo.com", :password => "12345678")
      @product.comments.create(:rating => 1, :user => @user, :body => "Awful bike!")
      @product.comments.create(:rating => 3, :user => @user, :body => "ok bike..")
      @product.comments.create(:rating => 5, :user => @user, :body => "gr8 bike!")
    end

    it "Expect the products average rating to equal 3" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "Product to not be valid" do
    before do
      @product = Product.create(:description => "A cool description.")
    end

    it "Expect not to be valid" do
      expect(@product).not_to be_valid
    end
  end
end
