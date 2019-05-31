class Tryout < ApplicationRecord
  belongs_to :player
  has_many :evaluations
  has_many :coaches, through: :evaluations
  
  validates :season, inclusion: {in: 2000..2100, message: "must be the year"}
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

  def next
    Tryout.all.where("id > ?", id).first
  end

  def prev
    Tryout.all.where("id < ?", id).last
  end

  def set_number
    if self.prev
      self.update(number: self.prev.number + 1)
    else
      self.update(number: 1)
    end
  end
end
