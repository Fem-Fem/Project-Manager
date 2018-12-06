class CompanySerializer < ActiveModel::Serializer
  attributes :id, :location, :password, :motto
  has_many :workers
  has_many :projects, through: :workers
end
