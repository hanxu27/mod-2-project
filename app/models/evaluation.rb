class Evaluation < ApplicationRecord
  belongs_to :tryout
  belongs_to :coach
  
  validates :tryout, presence: true
end
