class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  embedded_in :attachable, polymorphic: true

  has_mongoid_attached_file :data, path: ':attachment/:id/:style.:extension'
  validates_attachment_content_type :data,
    content_type: ['image/jpeg', 'image/jpg', 'image/png']
end
