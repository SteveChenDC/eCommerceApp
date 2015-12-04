class UserMailer < ApplicationMailer
	default from: "from@example.com"

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
				:to => 'stevechenweb@gmail.com',
				:subject => "A new contact form message from #{name}")
	end

  def purchase_successful(record)
    @record = record
    mail to: "stevechenweb@gmail.com", subject: "Your purchase information"
  end
end
