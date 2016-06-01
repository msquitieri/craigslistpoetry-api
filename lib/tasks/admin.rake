namespace :admin do

  desc 'Send all admins the notification email'
  task activity_notification: :environment do
    emails = AdminUser.pluck(:email)

    emails.each do |email|
      AdminMailer.activity(email).deliver!
    end
  end

end
