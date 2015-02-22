# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "mail#{n}@mail.com" }
    sequence(:name) { |n| "name #{n}" }
    created_at {1.day.ago}
    updated_at {1.day.ago}
    password "lsakdfjalsdkfj"
    password_confirmation "lsakdfjalsdkfj"


  end

end
