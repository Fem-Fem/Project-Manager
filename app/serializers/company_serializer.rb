class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :motto
  has_many :workers, serializer: WorkerSerializer
  has_many :projects, through: :workers, serializer: ProjectSerializer
end
