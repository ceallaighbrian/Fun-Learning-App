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

class Entry < ActiveRecord::Base

  belongs_to :user
  belongs_to :quiz
  has_many :entry_answers

  attr_accessor :message


  def self.create_entry(quiz_id, params, user)

    max_score = Entry.where(quiz: quiz_id, user: user).maximum(:score)

    entry = user.entries.create(quiz_id: quiz_id)
    params.each do |question_id, answer_id|
      entry.entry_answers.create!(answer_id: answer_id, question_id: question_id)
    end

    entry.calculate_score
    entry.message = user.new_entry(entry, max_score)
    entry
  end

  def calculate_score
    sum = 0
    entry_answers.each do |entry_answer|
      sum += 5 if entry_answer.answer.correct?
    end
    self.score = sum
    save!
  end



end
