# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class QuizTest < ActiveSupport::TestCase

  test 'create a quiz' do
    Quiz.create(name: 'test')
    assert Quiz.all.count > 1
  end

  test 'create a quiz and question at the same time' do



  end


end

