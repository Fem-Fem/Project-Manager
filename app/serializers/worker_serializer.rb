class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :rating, :company_id, :project_id
  belongs_to :company
  belongs_to :project
end