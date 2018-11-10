class Worker < ActiveRecord::Base
  belongs_to :company
  belongs_to :project
  validates_presence_of :name, :position
  validates :name, uniqueness: true

  def self.most_valuable(id)
    where('company_id = ?', id).order(rating: :desc).first
  end

end
