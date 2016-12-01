class UserMailer < ApplicationMailer
  default from: "sei@ulsa.edu.ni"

  def password_email(user)
    @user = user
    @user.random_password
    @user.save!
    @url = 'ulsa.edu.ni'
    mail(to: @user.email, subject: 'Sistema de Evaluación Integral ULSA')
  end
end
