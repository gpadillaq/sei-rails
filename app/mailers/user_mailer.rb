class UserMailer < ApplicationMailer
  default from: "gpadillaq@venbrain.com"

  def password_email(user)
    @user = user
    @user.random_password
    @user.save!
    @url = 'sei.venbrain.com'
    mail(to: @user.email, subject: 'Sistema de Evaluación Integral ULSA')
  end

  def docente_email(user, files)
    @user = user
    @url = 'sei.venbrain.com'
    files.each do |file|
      attachments[file[:name]] = File.read(file[:path])
    end
    mail(to: @user.email, subject: 'Sistema de Evaluación Integral ULSA')
  end
end
