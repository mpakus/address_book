RSpec.describe ImportCsvFile do
  describe '.perform' do
    let(:file) { Rails.root.join('spec', 'fixtures', 'files', 'contacts.csv') }
    let(:petr) { User.find_by_full_name('Petr Petrov') }
    before { @errors = ImportCsvFile.perform(file) }

    it 'import contacts with 1 expected error' do
      expect(@errors.count).to eq 1
    end

    it 'total imported 4 users only' do
      expect(User.count).to eq 4
    end

    it 'Petr Petrov has 2 phones' do
      expect(petr.phones.count).to eq 2
    end

    it 'Petr Petrov has 3 emails' do
      expect(petr.emails.count).to eq 3
    end
  end
end

