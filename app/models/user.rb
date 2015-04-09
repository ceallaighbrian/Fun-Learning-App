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
#  last_login      :datetime
#

class User < ActiveRecord::Base

  belongs_to :level
  has_many :entries

  after_create :award_sign_up_bonus

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: {minimum: 6}


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def quiz_scores
    hash = {}
    Quiz.all.each do |q|
      hash["#{q.name}"] = Entry.where(quiz: q, user: id).maximum(:score)
    end
    hash
  end

  def award_sign_up_bonus
    update_attribute(:score, 10)
    update_attribute(:level_id, 1)
    update_attribute(:last_login, Time.now)
  end

  def award_login_bonus
    if last_login < 1.day.ago
      update_score_and_level(2)
      update_attribute(:last_login, Time.now)
      return 'Login Bonus - 2 points has been added to your score'
    end
    return ''
  end

  #Check entry and if it is the highest for that quiz, update score
  def new_entry(entry, highest_score)

    if Entry.where(quiz: entry.quiz, user: id).count == 1
      update_score_and_level(entry.score)
      return "Congrats, on your first time taking this quiz your score has increased by #{entry.score}"
    elsif entry.score >= highest_score
      diff = entry.score - highest_score
      update_score_and_level(diff)
      return "Congrats, you beat your last score, your score has increased by #{diff}"
    end
    return ""
  end


  def update_score_and_level(new_points)
    new_score = score + new_points
    update_attribute(:score, new_score)
    new_level = Level.find_level_for_score(new_score)
    if new_level && (!level || new_level.id > level_id)
      update_attribute(:level_id, new_level.id)
    end
  end


  def next_level
    next_levels = []
    Level.all.each do |level|
      next_levels << level unless level.id <= level_id
    end
    next_levels
  end



end


