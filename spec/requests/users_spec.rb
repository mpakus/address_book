RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:mail_to) { Faker::Internet.email }
  subject { response }

  describe 'GET /users' do
    it 'shows index.html' do
      get users_path
      expect(subject).to render_template :index
    end
  end

  describe 'GET /users/new' do
    it 'shows new.html' do
      get new_user_path
      expect(subject).to render_template :new
    end
  end

  describe 'POST /users/:id/share' do
    context 'with wrong :id' do
      before { post share_user_path(id: 'WRONG_ID') }

      it 'returns 404' do
        expect(subject.status).to eq 404
      end
    end

    context 'when empty mail_to' do
      before { post share_user_path(user.id), mail_to: nil }

      it 'flash alert' do
        expect(flash[:alert]).to include I18n.t('users.share.fail')
      end
    end

    context 'with right :id' do
      before { post share_user_path(user.id), mail_to: mail_to }

      it { is_expected.to redirect_to users_path }

      it 'flash notice' do
        expect(flash[:notice]).to include I18n.t('users.share.success')
      end

      it 'email is sent' do
        expect(ActionMailer::Base.deliveries.count).to eq 1
      end
    end
  end
end
