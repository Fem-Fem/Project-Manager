class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :workers
  has_many :companies, through: :workers
end
