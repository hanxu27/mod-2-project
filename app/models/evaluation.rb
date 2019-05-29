class Evaluation < ApplicationRecord
  belongs_to :tryout
  belongs_to :coach
  
  validates :tryout, presence: true

  def skill
    [serve, sr, setting, hitting, passing]
  end

  def soft
    [coachability, athleticism, communication, vball_iq]
  end

  def skill_score
    begin
      output = self.skill.sum
    rescue => exception
      output = "incomplete"
    end
    output
  end

  def soft_score
    begin
      output = self.soft.sum
    rescue => exception
      output = "incomplete"
    end
    output
  end

  def total_score
    self.skill_score == "incomplete" || self.soft_score == "incomplete" ? "incomplete" : self.skill_score + self.soft_score
  end
end
