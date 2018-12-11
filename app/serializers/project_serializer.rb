class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :errors
  has_many :workers, serializer: WorkerSerializer
  has_many :companies, through: :workers, serializer: CompanySerializer
end
