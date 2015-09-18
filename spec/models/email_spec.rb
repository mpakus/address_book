RSpec.describe Email, type: :model do
  subject { build(:email) }

  context 'with validation' do
    it 'checks empty email' do
      subject.email = nil
      subject.valid?
      expect(subject.errors[:email].count).to be > 0
    end
  end
end
