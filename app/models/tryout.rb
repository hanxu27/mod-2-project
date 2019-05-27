class Tryout < ApplicationRecord
  belongs_to :player
  has_many :evaluations
  has_many :coaches, through: :evaluations
  
  validates :season, inclusion: {in: 2019..2100, message: "must be the year"}
  validates :age_group, inclusion: 10..18
end
