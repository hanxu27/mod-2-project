class Team < ApplicationRecord
  belongs_to :coach
  belongs_to :player
end
