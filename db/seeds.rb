require 'faker'

def create_user
  user = User.create(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name
  )
  rand(1..5).times { user.phones.create(phone: Faker::PhoneNumber.cell_phone) }
  rand(1..5).times { user.emails.create(email: Faker::Internet.email) }
end

100.times { create_user }
