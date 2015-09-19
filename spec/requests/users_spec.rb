RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'shows index.html' do
      get users_path
      expect(response).to render_template :index
    end
  end

  describe 'GET /users/new' do
    it 'shows new.html' do
      get new_user_path
      expect(response).to render_template :new
    end
  end
end
