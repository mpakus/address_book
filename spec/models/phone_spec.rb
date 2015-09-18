RSpec.describe Phone, type: :model do
  subject { build(:phone) }

  context 'with validation' do
    it 'checks empty phone' do
      subject.phone = nil
      subject.valid?
      expect(subject.errors[:phone].count).to be > 0
    end
  end
end
