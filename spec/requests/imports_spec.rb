RSpec.describe 'Imports', type: :request do
  let(:file){ fixture_file_upload("#{Rails.root}/spec/fixtures/files/contacts.csv") }
  let(:file_correct){ fixture_file_upload("#{Rails.root}/spec/fixtures/files/contacts_correct.csv") }

  subject{ response }

  describe 'GET /imports' do
    it 'shows index.html' do
      get imports_path
      expect(subject).to render_template :index
    end
  end

  describe 'POST /imports' do
    it 'shows index.html if has any errors' do
      post imports_path
      expect(subject).to render_template :index
    end

    it 'redirects to index if success' do
      post imports_path, import: { file: file_correct }
      expect(subject.status).to eq 302
    end
  end
end
