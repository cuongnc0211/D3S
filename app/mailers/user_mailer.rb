class UserMailer < ApplicationMailer
  
  def send_password_to_user email, password
    @email = email
    @password = password
    mail(to: @email, subject: "Send Password To User")
  end

  def self.send_email_when_user_created user, user_email
    @emails = User.admin.map(&:email)
    @user = user

    @emails.each do |email|
      send_email_admin(email, @user, user_email).deliver_now
    end
  end

  def send_email_admin email, user, user_email
    @user_email = user_email
    mail(to: email, subject: "Created new user: #{user}")
  end
end
