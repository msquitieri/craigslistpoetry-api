class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.activity.subject
  #
  def activity(email)
    @poem_count = Poem.where('created_at > ?', Date.today - 1.day).count

    mail to: email
  end
end
