class Worker < ActiveRecord::Base
  belongs_to :company
  belongs_to :project
  validates_presence_of :name, :position, :rating
  validates :name, uniqueness: true
  validates :rating, numericality: { only_integer: true }

  def self.most_valuable(id)
    where('project_id = ?', id).order(rating: :desc).first
  end

end
