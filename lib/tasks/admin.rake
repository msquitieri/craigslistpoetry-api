namespace :admin do

  desc 'Send all admins the notification email'
  task activity_notification: :environment do
    puts 'Sending activity notifications'
    emails = AdminUser.pluck(:email)

    emails.each do |email|
      puts "Sending notification to #{email}"

      AdminMailer.activity(email).deliver!
    end

    puts 'Done.'
  end

end
