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

class Entry < ActiveRecord::Base

  belongs_to :user
  belongs_to :quiz
  has_many :entry_answers

  def self.create_entry(quiz_id, params, user)

    entry = user.entries.create(quiz_id: quiz_id)

    params.each do |question_id, answer_id|
      entry.entry_answers.create!(answer_id: answer_id, question_id: question_id)
    end





    entry


  end

end
