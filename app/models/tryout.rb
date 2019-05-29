class Tryout < ApplicationRecord
  belongs_to :player
  has_many :evaluations
  has_many :coaches, through: :evaluations
  
  validates :season, inclusion: {in: 2019..2100, message: "must be the year"}
  validates :age_group, inclusion: 10..18
  validates :reach, numericality: true, on: :update
  validates :approach_jump, numericality: true, on: :update
  validates :block_jump, numericality: true, on: :update
  validates :point_touch, numericality: true, on: :update
  validates :dash, numericality: true, on: :update

  def skill_score
    score = 0
    incomplete = self.evaluations.select { |e| e.total_score == "incomplete" }.count
    total = self.evaluations.count - incomplete
    # avoid divided by 0
    total = 1 if total == 0
    self.evaluations.each do |e|
      e.skill_score == "incomplete" ? score : score += e.skill_score
    end
    score / total
  end

  def soft_score
    score = 0
    incomplete = self.evaluations.select { |e| e.total_score == "incomplete" }.count
    total = self.evaluations.count - incomplete
    total = 1 if total == 0
    self.evaluations.each do |e|
      e.soft_score == "incomplete" ? score : score += e.soft_score
    end
    score / total
  end

  def total_score
    skill_score + soft_score
  end
end
