class Project < ActiveRecord::Base
  has_many :workers
  has_many :companies, through: :workers
end
