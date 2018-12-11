class Company < ActiveRecord::Base
  has_many :workers
  has_many :projects, -> {distinct}, through: :workers
  has_secure_password
  validates_presence_of :name, :location, :motto
  validates :name, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
  	oauth_name = auth_hash["info"]["name"] || auth_hash["extra"]["raw_info"]["login"]
  	self.where(:name =>oauth_name).first_or_create do |company|
  		company.password = SecureRandom.hex
      company.name = auth_hash["info"]["name"] || auth_hash["extra"]["raw_info"]["login"]
      company.location = auth_hash["extra"]["raw_info"]["location"] || "Github"
      company.motto = auth_hash["extra"]["raw_info"]["bio"] || "Live, Laugh, Love"
      company.save
      return company
  	end
  end
end
