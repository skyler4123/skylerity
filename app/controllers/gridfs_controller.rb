class GridfsController < ApplicationController
  def attachment
    @image = Image.first
    content = @image.attachment.read
    if stale?(etag: content, last_modified: @image.updated_at.utc, public: true)
      send_data content, type: @image.attachment.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end
end
