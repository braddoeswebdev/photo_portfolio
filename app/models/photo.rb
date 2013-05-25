class Photo < ActiveRecord::Base
  attr_accessible :collection_id, :image, :notes
  belongs_to :collection

  has_attached_file :image, :styles => {thumb: '100x100>', medium: '512x512>', large: '1024x768#'}
end
