class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :rating
  belongs_to :company
  belongs_to :project
end