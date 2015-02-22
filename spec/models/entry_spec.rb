# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'


RSpec.describe Entry, type: :model do

  context 'Quiz with questions and answers exists' do

    before do
      @quiz = FactoryGirl.create(:quiz)

      @question1 = FactoryGirl.create(:question, quiz: @quiz)
      FactoryGirl.create_list(:answer, 4, question: @question1)
      @right_answer1 = FactoryGirl.create(:answer, question: @question1, correct: true)

      @question2 = FactoryGirl.create(:question, quiz: @quiz)
      FactoryGirl.create_list(:answer, 4, question: @question2)
      @right_answer2 = FactoryGirl.create(:answer, question: @question2, correct: true)

      @user = FactoryGirl.create(:user)
    end


    it 'should print out the number of quizzes' do
      params = {
          @question1.id => @right_answer1.id,
          @question2.id => @right_answer2.id
      }

      Entry.create_entry(@quiz.id, params, @user)

      expect(Entry.count).to eq(1)
      expect(EntryAnswer.count).to eq(2)
      # expect(EntryAnswer.first.user).to eq(@user)
      # expect(EntryAnswer.first.quiz).to eq(@quiz)

    end
  end
end
