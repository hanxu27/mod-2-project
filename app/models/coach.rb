class Coach < ApplicationRecord
  has_many :evaluations
  has_many :tryouts, through: :evaluations
  belongs_to :team, optional: true
  has_many :players, through: :team
  has_secure_password
  
  def delete_incomplete
    self.evaluations.each do |e|
      e.destroy if e.total_score == "incomplete"
    end
  end
end
