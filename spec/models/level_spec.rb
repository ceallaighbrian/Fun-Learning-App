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

require 'rails_helper'

RSpec.describe Level, type: :model do
end
