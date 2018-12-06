class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :rating
end