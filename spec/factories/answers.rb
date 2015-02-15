# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  name        :string
#  correct     :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#

FactoryGirl.define do
  factory :answer do
    
  end

end
