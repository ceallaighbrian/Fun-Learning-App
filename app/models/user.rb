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
  end

  #Check entry and if it is the highest for that quiz, update score
  def new_entry(entry, highest_score)
    if Entry.where(quiz: entry.quiz, user: id).count == 1
      update_score_and_level(entry.score)
    else
      if entry.score >= highest_score
        diff = entry.score - highest_score
        update_score_and_level(diff)
      end
    end
  end

  def update_score_and_level(new_points)
    new_score = score + new_points
    update_attribute(:score, new_score)
    new_level = Level.find_level_for_score(new_score)
    if new_level && (!level || new_level.id > level_id)
      update_attribute(:level_id, new_level.id)
    end
  end


end

