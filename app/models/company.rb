class Company < ActiveRecord::Base
  has_many :workers
  has_many :projects, through: :workers
  has_secure_password
  validates_presence_of :name, :location, :password, :motto
  validates :name, uniqueness: true
  validates :motto, uniqueness: true
end
