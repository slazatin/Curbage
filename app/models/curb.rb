class Curb
  include Mongoid::Document

  include Mongoid::Paperclip

  has_mongoid_attached_file :picture

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  field :subject, type:String
  field :address, type:String
  field :content, type:String

  belongs_to :user
  
end
