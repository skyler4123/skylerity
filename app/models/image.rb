class Image
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :attachment, AttachmentUploader

  belongs_to :user

  def url(version = nil)
    attachment.url(version)
  end
end
