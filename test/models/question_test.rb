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

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "Create question" do
    Question.create(name: 'What is the capital of Ireland')
    assert Question.all.count > 1
  end

  test 'Create a question with and an answer' do

    question = Question.create(name: 'What is the capital of Ireland')
    question.answers.create(name: 'Cork', correct: 'false')
    puts Question.all.count
    assert Question.all.count == 1
    assert Answer.all.count == 1


  end



end
