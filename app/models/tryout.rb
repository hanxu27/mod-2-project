class Tryout < ApplicationRecord
  belongs_to :player
  has_many :evaluations
  has_many :coaches, through: :evaluations
  
  validates :season, inclusion: {in: 2019..2100, message: "must be the year"}
  validates :age_group, inclusion: 10..18
  validates :reach, numericality: true
  validates :approach_jump, numericality: true
  validates :block_jump, numericality: true
  validates :point_touch, numericality: true
  validates :dash, numericality: true

  def skill_score
    score = 0
    # avoid divided by 0
    self.evaluations.count == 0 ? total = 1 : total = self.evaluations.count
    self.evaluations.each do |e|
      e.skill_score == "incomplete" ? score : score += e.skill_score
    end
    score / total
  end

  def soft_score
    score = 0
    total = 0
    self.evaluations.count == 0 ? total = 1 : total = self.evaluations.count
    self.evaluations.each do |e|
      e.soft_score == "incomplete" ? score : score += e.soft_score
    end
    score / total
  end

  def total_score
    skill_score + soft_score
  end
end
