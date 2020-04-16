class User < ApplicationRecord
	has_many :gardens, dependent: :destroy
	has_many :garden_plants, dependent: :destroy
  validates_presence_of :email, :google_token
  validates :email, uniqueness: true
	validates :zip_code, length: {minimum: 5, maximum: 5}, allow_blank: true

  def self.from_omniauth(auth)
    where(email: auth["info"]["email"]).first_or_initialize do |user|
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end
