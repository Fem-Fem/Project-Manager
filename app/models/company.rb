class Company < ActiveRecord::Base
  has_many :workers
  has_many :projects, through: :workers
end
