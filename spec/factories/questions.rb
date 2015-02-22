# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  name       :string
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryGirl.define do
  factory :question do
    quiz
    sequence :name do |n|
      "Question #{n}"
    end

  end

end
