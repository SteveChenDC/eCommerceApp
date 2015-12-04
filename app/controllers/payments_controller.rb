class PaymentsController < ApplicationController
  Stripe.api_key = "sk_test_C2Zt57LyKyl4s9s9b1wMVEAw"
  def create
    # Finds product with the params of :product_id
    @product = Product.find(params[:product_id])
    # Refers to current user
    @user = current_user
    # Get credit card details submitted by the form
    token = params[:stripeToken]
    # Create charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price.to_d * 100).to_i, # amount in cents
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
        )
      if charge.paid
        @order = Order.create(
          :product_id => @product.id,
          :user_id => current_user,
          :total => @product.price
          )
        UserMailer.purchase_successful(@user, 'The order has been received!', @order).deliver_now
      end
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    # This redirects to product page after user submits the payment
    # redirect_to product_path(@product)
  end
end
