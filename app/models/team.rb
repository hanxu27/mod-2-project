class Team < ApplicationRecord
  has_many :coaches
  has_many :players

  validates :age_group, numericality: true
end
