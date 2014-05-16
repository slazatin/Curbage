class Curb
  include Mongoid::Document

  field :subject, type:String
  field :address, type:String
  field :content, type:String
  
end
