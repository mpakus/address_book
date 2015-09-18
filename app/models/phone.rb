class Phone < ActiveRecord::Base
  validates :phone, presence: true

  belongs_to :user
end
