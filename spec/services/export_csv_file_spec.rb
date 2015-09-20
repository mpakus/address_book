RSpec.describe ExportCsvFile do
  describe '.perform' do
    let(:file_name) { 'contacts.csv' }
    before { create_list(:user, 5) }

    it 'returns file path' do
      file_path = ExportCsvFile.perform(User.includes(:emails, :phones).all, file_name)
      expect(file_path).to include file_name
    end
  end
end
