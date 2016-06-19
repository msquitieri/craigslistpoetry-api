require "rails_helper"

RSpec.describe AdminMailer, :type => :mailer do
  describe "activity" do
    let!(:admin) { create(:admin_user) }
    let(:mail) { AdminMailer.activity(admin.email) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your Daily Poems Count")
      expect(mail.to).to eq([admin.email])
      expect(mail.from).to eq(["michael.squitieri@gmail.com"])
    end

    context 'when no poems have been generated' do
      it 'says there are 0 poems created today' do
        expect(mail.body.encoded).to match('There were 0 poems created today.')
      end
    end

    context 'when one poem has been generated' do
      it 'says there is 1 poem created today' do
        create(:poem, created_at: Time.now - 2.minutes)
        create_list(:poem, 5, created_at: Time.now - 3.days)

        expect(mail.body.encoded).to match('There was 1 poem created today.')
      end
    end

    context 'when multiple poems have been generated' do
      it 'says there are 0 poems created today' do
        create_list(:poem, 3, created_at: Time.now - 2.minutes)
        create_list(:poem, 10, created_at: Time.now - 3.days)

        expect(mail.body.encoded).to match('There were 3 poems created today.')
      end
    end
  end

end
