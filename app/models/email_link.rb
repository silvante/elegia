class EmailLink < ApplicationRecord
  belongs_to :user
  after_create :send_email

  def self.generate(email)
    user = User.find_by(email: email)
    if !user
      User.create(email: email, password: TokenGenerator.generate(8))
    end
    create(user: user, expires_at: Date.today + 1.day, token: generate_token)
  end

  def self.generate_token
    TokenGenerator.generate(16)
  end

  private

  def send_email
    EmailLinkMailer.sign_in_mail(self).deliver_now
  end
end
