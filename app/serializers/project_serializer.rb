class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :errors
  has_many :workers
  has_many :companies, through: :workers
end
