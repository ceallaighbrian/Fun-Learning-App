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


require 'rails_helper'


RSpec.describe Question, type: :model do


  it "Create question" do
    Question.create(name: 'What is the capital of Ireland')
    expect(Question.all.count).to  eq(1)
  end

  it 'Create a question with and an answer' do

    question = Question.create(name: 'What is the capital of Ireland')
    question.answers.create(name: 'Cork', correct: 'false')
    puts Question.all.count
    expect(Question.all.count).to  eq(1)
    expect(Answer.all.count).to  eq(1)
  end



end
