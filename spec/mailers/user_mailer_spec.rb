require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "purchase_" do
    let(:mail) { UserMailer.purchase_ }

    it "renders the headers" do
      expect(mail.subject).to eq("Purchase ")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "successful" do
    let(:mail) { UserMailer.successful }

    it "renders the headers" do
      expect(mail.subject).to eq("Successful")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
