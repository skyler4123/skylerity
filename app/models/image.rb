class Image
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :attachment, AttachmentUploader
end
