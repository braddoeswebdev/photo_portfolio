class Collection < ActiveRecord::Base
  attr_accessible :cover_id, :name, :notes, :code
  has_many :photos
  belongs_to :cover, :class_name => "Photo"
end
