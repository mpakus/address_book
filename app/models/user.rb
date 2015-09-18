class User < ActiveRecord::Base
  before_validation :set_full_name

  validates :first_name, :last_name, :full_name, presence: true
  validates :full_name, uniqueness: true

  has_many :phones
  has_many :emails

  private

  def set_full_name
    self.full_name = "#{first_name} #{last_name}"
  end
end
