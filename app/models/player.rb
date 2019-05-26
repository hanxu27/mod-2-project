class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :tryouts
  has_many :evaluations, through: :tryouts
  has_secure_password
  
  validates :name, format: { with: /\A[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*\z/, message: "format error" }, uniqueness: true, on: :create
  validates :password, length: { within: 0..40 }, on: :create
  validates :birthday, format: { with: /\d{4}\D\d{2}\D\d{2}/, message: "invalid"}, on: :update
  validate :validate_birthday, on: :update
  validates :height, numericality: { between: 120..220 }, on: :update
  validates :parent_name, format: { with: /\A[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*\z/, message: "format error" }, on: :update
  validates :parent_number, format: { with: /\d{3}\D\d{3}\D\d{4}/, message: "check format"}, on: :update
  validates :playing_experience, length: { maximum: 230, message: "too long" }, on: :update
  validates :additional_comments, length: { maximum: 270, message: "too long" }, on: :update
  
  private
    def validate_birthday
      begin
        Date.parse(@birthday)  
      rescue => exception
        return false
      end
      true
    end
end
