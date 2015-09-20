RSpec.describe 'Exports', type: :request do
  subject { response }
  before { post exports_path }

  describe 'POST /exports' do
    it { is_expected.to be_ok }

    it 'include file name' do
      expect(subject.header['Content-Disposition']).to include 'contacts_export'
    end

    it 'include content type' do
      expect(subject.header['Content-Type']).to include 'csv'
    end
  end
end
