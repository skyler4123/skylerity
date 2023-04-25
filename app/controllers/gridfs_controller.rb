class GridfsController < ApplicationController
  before_action :set_image

  def image
    content = @image.attachment.read
    if stale?(etag: content, last_modified: @image.updated_at.utc, public: true)
      send_data content, type: @image.attachment.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  def thumb_image
    content = @image.attachment.thumb.read
    if stale?(etag: content, last_modified: @image.updated_at.utc, public: true)
      send_data content, type: @image.attachment.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  def avatar_image
    content = @image.attachment.avatar.read
    if stale?(etag: content, last_modified: @image.updated_at.utc, public: true)
      send_data content, type: @image.attachment.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end
end
