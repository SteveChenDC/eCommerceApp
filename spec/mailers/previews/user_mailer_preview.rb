# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/purchase_
  def purchase_
    UserMailer.purchase_
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/successful
  def successful
    UserMailer.successful
  end

end
