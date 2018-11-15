class Company < ActiveRecord::Base
  has_many :workers
  has_many :projects, through: :workers
  has_secure_password
  # replace motto with bio? remove motto uniqueness?
  validates_presence_of :name, :location, :password, :motto
  validates :name, uniqueness: true
  validates :motto, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
    binding.pry
  	# oauth_name = auth["info"]["name"]
    # oauth_location = auth["extra"]["raw_info"]["location"]
    # oauth_motto = auth["extra"]["raw_info"]["bio"]
  	self.where(:name =>oauth_name).first_or_create do |company|
  		company.password = SecureRandom.hex
      company.name = auth["info"]["name"]
      company.location = auth["extra"]["raw_info"]["location"]
      company.motto = auth["extra"]["raw_info"]["bio"]
  	end
  end
end
