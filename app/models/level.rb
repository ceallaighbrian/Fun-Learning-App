# == Schema Information
#
# Table name: levels
#
#  id             :integer          not null, primary key
#  name           :string
#  required_score :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Level < ActiveRecord::Base
  has_many :users


  #Check which level score is at
  def find_level_for_score(score)
    Level.where(:conditions => ["required_score <= ?", score], :order =>"required_score DESC").first
  end

end
