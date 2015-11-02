if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV["STRIPE_SECRET_KEY"]
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_THGpVnxjFyjx5CEfaUyok2Xv',
    :secret_key => ENV['sk_test_C2Zt57LyKyl4s9s9b1wMVEAw']
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]