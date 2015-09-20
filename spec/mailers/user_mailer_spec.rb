RSpec.describe UserMailer, type: :mailer do
  describe '.share' do
    let(:anna) { create(:user, first_name: 'Anna') }
    let(:mail_to) { Faker::Internet.email }
    let(:mail) { UserMailer.share(anna, mail_to) }

    it 'has correct subject' do
      expect(mail.subject).to eq I18n.t('user_mailer.share.subject')
    end

    it 'has correct recipient' do
      expect(mail.to).to include mail_to
    end

    it 'mail has full name of user' do
      expect(mail.body.encoded).to match anna.full_name
    end
  end
end
