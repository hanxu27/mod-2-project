class Coach < ApplicationRecord
  has_many :evaluations
  has_many :tryouts, through: :evaluations
  belongs_to :team, optional: true
  has_many :players, through: :team
  has_secure_password
  
  validates :password, length: { within: 0..40 }, on: :create
  validates :email, format: { with: /\A([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/, message: "invalid" }
  def delete_incomplete
    self.evaluations.each do |e|
      e.destroy if e.total_score == "incomplete"
    end
  end
end
