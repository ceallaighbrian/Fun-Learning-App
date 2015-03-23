# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  score      :integer
#

FactoryGirl.define do
  factory :entry do
    user
    quiz
    score 7

  end

end
