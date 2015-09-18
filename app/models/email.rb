class Email < ActiveRecord::Base
  validates :email, presence: true

  belongs_to :user
end
