class Curb
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_mongoid_attached_file :picture

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  field :name, type:String
  field :subject, type:String
  field :address, type:String
  field :content, type:String

  belongs_to :user

  def self.party
    # If no movie specified, use The Matrix
    # movie ||= "matrix"

    # Authentication key for rotton tomatoes -- put yours in:
    auth = { query: { auth_token:"2e3ef38174a9eaea6d7abb2f6460a213", retvals:"external_id,category,category_group,heading,body,images,price,location,external_url", category_group:"SSSS", has_image:1, radius:"10mi", lat: "33.986359", long: "-118.473362", heading: "free", rpp:100}} # Adds to end of URL ?apikey=<YOURKEY>&q=<MOVIE>
    
    search_url = "http://search.3taps.com/"
    
    response = HTTParty.get search_url, auth

    response["postings"]


    # auth = { query: { apikey: 'pjz23qq9uhq7tfwzd7r7xw9r' }}
    
    # id = # INSERT CODE HERE: Get the value of 'movies' 0 'id' in the nested response hash
    #      # HINT: It should be something like this: response['stuff'][1]['morestuff']
    # movie_url = "http://api.rottentomatoes.com/api/public/v1.0/movies/#{id}.json"

    # response = HTTParty.get movie_url, auth
    
  end
  
end

# http://search.3taps.com/?auth_token=2e3ef38174a9eaea6d7abb2f6460a213&rpp=100&retvals=external_id,category,heading,body,images,price,location,external_url&category_group=SSSS&has_image=1&radius=5mi&lat=33.986359&long=-118.473362&heading=(%22free%22)
