class InvitationMailer < ActionMailer::Base
    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    #default from: "<salut.amos@gmail.com>"
    default from: "#{SmtpConfig.first.smtp_user_name}" if SmtpConfig.first.present?

    def invitation_mail(user, invitation, url)
        @user = user
        @invitation = invitation
        @url = url
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "Nouvelle invitation")
    end
end