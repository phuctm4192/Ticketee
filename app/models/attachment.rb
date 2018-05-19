class Attachment < ApplicationRecord
  belongs_to :ticket

  mount_uploader :file, AttachmentUploader
end
