class Coach < ApplicationRecord
  has_many :evaluations
  has_many :tryouts, through: :evaluations
  belongs_to :team, optional: true
  has_many :players, through: :team
  has_secure_password
  
end
