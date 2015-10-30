# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    password "12345678"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end

  factory :product do
    name "cool bike"
    description "Pretty cool bike"
    colour "Green"
  end

  factory :comment do
    product
    body "stuff and stuff"
    rating "3"
    product_id "1"
  end

  factory :order do
    user
    total "33.99"
  end
end




# Only one test doesn't pass
# FactoryGirl.define do
#   factory :user do
#     first_name "John"
#     last_name  "Doe"
#     password "12345678"
#     admin false
#   end

#   # This will use the User class (Admin would have been guessed)
#   factory :admin, class: User do
#     first_name "Admin"
#     last_name  "User"
#     admin      true
#   end

#   factory :product do
#     name "A bike"
#     description "Pretty cool bike"
#     colour "Green"
#   end

#   factory :comment do
#     body "stuff and stuff"
#     rating "3"
#     product_id "1"
#   end

#   factory :order do
#     user_id
#     product_id 20
#     total "33.99"
#   end
# end
