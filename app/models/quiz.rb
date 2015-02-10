# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quiz < ActiveRecord::Base
  has_many :questions
  accepts_nested_attributes_for :questions





end
