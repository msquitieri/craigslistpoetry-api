class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.activity.subject
  #
  def activity(email)
    @poem_count = Poem.where('created_at > ?', Time.now - 1.day).count

    mail to: email, subject: 'Your Daily Poems Count'
  end
end
