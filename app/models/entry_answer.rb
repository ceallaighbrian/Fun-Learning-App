# == Schema Information
#
# Table name: entry_answers
#
#  id          :integer          not null, primary key
#  entry_id    :integer          not null
#  answer_id   :integer          not null
#  question_id :integer
#

class EntryAnswer < ActiveRecord::Base
  belongs_to :entry
  belongs_to :answer
  belongs_to :question



end
