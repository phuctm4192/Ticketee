class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :author, class_name: "User"
  delegate :project, to: :ticket

  validates :text, presence: true

  scope :persisted, lambda { where.not(id: nil) }
end
