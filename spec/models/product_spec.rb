require 'rails_helper'

describe Product do 

  context "Average rating display 3" do

    before do 
      @product = build(:product,
        name: "race bike") 
      @user = build(:user,
        email: "email@yahoo.com",
        password: "12345678")
      @comment1 = build(:comment,
        rating: 1, 
        user: @user, 
        body: "Awful bike!")
      @comment2 = build(:comment,
        rating: 3,
        user: @user,
        body: "ok bike..")
      @comment3 = build(:comment, 
        rating: 5,
        user: @user,
        body: "gr8 bike!")
    end

    it "Expect the products average rating to equal 3" do
      expect(@product.average_rating).to eq 3.0
    end
  end

  context "Product to not be valid" do

    it "Should not validate without name" do
      @product = build(:product, description: "Race Bike desc")
      expect(@product).not_to be_valid
    end
  end
end
