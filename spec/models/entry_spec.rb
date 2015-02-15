require 'rails_helper'

RSpec.describe Entry, type: :model do

  context 'Quiz with questions and answers exists' do

    before do
      FactoryGirl.create(:quiz)
    end


    it 'should print out the number of quizzes' do
      puts Quiz.all.count
    end





  end


end
