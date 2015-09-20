class User < ActiveRecord::Base
  before_validation :set_full_name

  validates :first_name, :last_name, :full_name, presence: true
  validates :full_name, uniqueness: true

  has_many :phones
  has_many :emails

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true

  paginates_per 25

  private

  def set_full_name
    self.full_name = "#{first_name} #{last_name}"
  end
end
