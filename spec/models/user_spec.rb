RSpec.describe User, type: :model do
  subject { build(:user) }

  context 'with validation' do
    it 'checks empty first_name' do
      subject.first_name = nil
      subject.valid?
      expect(subject.errors[:first_name].count).to be > 0
    end

    it 'checks empty last_name' do
      subject.last_name = nil
      subject.valid?
      expect(subject.errors[:last_name].count).to be > 0
    end

    it 'checks uniqueness of full_name' do
      create(:user, first_name: subject.first_name, last_name: subject.last_name)
      subject.valid?
      expect(subject.errors[:full_name].count).to be > 0
    end
  end

  describe '#full_name' do
    it 'concatenates first and last names using space' do
      subject.save
      expect(subject.full_name).to eq "#{subject.first_name} #{subject.last_name}"
    end
  end
end
