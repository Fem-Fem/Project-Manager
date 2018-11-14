class Company < ActiveRecord::Base
  has_many :workers
  has_many :projects, through: :workers
  has_secure_password
  validates_presence_of :name, :location, :password, :motto
  validates :name, uniqueness: true
  validates :motto, uniqueness: true

  # def self.find_or_create_by_omniauth(auth_hash)
  # 	oauth_name = auth["info"]["name"]
  # 	self.where(:name =>oauth_name).first_or_create do |company|
  # 		company.password = SecureRandom.hex
  # 	end
  # end
end
