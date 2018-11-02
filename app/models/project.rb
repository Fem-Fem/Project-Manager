class Project < ActiveRecord::Base
  has_many :workers
  has_many :companies, through: :workers
  validates_presence_of :name, :description
  validates :name, uniqueness: true
  validates :description, uniqueness: true
end
