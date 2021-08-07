class ApplicationMailer < ActionMailer::Base
  #default from: "salut.amos@gmail.com"
  default from: "#{SmtpConfig.first.smtp_user_name}" if SmtpConfig.first.present?
  layout 'mailer'
end
