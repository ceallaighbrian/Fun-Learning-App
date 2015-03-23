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
    name 'Level 1'
    required_score 10
  end

end
