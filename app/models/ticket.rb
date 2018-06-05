class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :author, class_name: "User"
  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :state
  
  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  before_create :assign_default_state

  #a ||= b is equivalent a || a = b
  #if left side is true, we no need to check right side
  private
  def assign_default_state
    self.state ||= State.default
  end
end
