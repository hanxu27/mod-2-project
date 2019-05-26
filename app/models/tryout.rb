class Tryout < ApplicationRecord
  belongs_to :player
  has_many :evaluations
  has_many :coaches, through: :evaluations
  
end
