# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  level_id        :integer
#  score           :integer
#

class User < ActiveRecord::Base

  belongs_to :level
  has_many :entries

  after_create :award_sign_up_bonus

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: {minimum: 6}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def quiz_attempts
    hash = {}
    Quiz.all.each do |q|
    hash["#{q.name}"] = self.entries.where("quiz_id = #{q.id}").count
  end
    hash
  end


  def update_score_and_level(new_points)
    new_score = self.score += new_points
    self.update_attribute(:score, new_score)
    new_level = Level.find_level_for_score(new_score)
    if new_level && (!self.level || new_level.id > self.level_id)
      self.update_attribute(:level_id, new_level.id)
    end
  end

  def award_sign_up_bonus
    update_score_and_level(10)
  end
end

