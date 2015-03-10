# == Schema Information
#
# Table name: levels
#
#  id             :integer          not null, primary key
#  name           :string
#  required_score :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :level do
    name "MyString"
required_score 1
  end

end
