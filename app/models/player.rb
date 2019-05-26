class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :tryouts
  has_many :evaluations, through: :tryouts
  has_secure_password
  
end
