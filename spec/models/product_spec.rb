require 'rails_helper'

describe Product do 

  context "Product to not be valid" do

    before do
      @product = build(:product,
        name: " ", 
        description: "Race Bike desc")
    end

    it "Should not validate without name" do
      expect(@product).to_not be_valid
    end
  end

  context "Average rating display 3" do

    before do 
      @product = create(:product,
        description: "more stuff",
        ) 
      @user = create(:user,
        first_name: "name1",
        last_name: "name2",
        email: "email@yahoo.com",
        password: "12345678")
      @comment1 = create(:comment,
        rating: 1, 
        user: @user, 
        body: "Awful bike!",
        )
      @comment2 = create(:comment,
        rating: 3,
        user: @user,
        body: "ok bike..",
        )
      @comment3 = create(:comment, 
        rating: 5,
        user: @user,
        body: "gr8 bike!",
        )
    end

    it "Expect the products average rating to equal 3" do
      expect(@product.average_rating).to eq 3.0
    end
  end
end
