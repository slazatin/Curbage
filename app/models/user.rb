require "bcrypt"
class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String


  validates :email, :name, uniqueness: :true, presence: :true
  has_many :curbs

def password
	@password
end

def password=(new_password)
	@password = new_password
	self.password_digest = BCrypt::Password.create(new_password)
end

def authenticate(test_password)
	if BCrypt::Password.new(self.password_digest)==test_password
		self
	else
		# flash[:error] = "Invalid email/password combination"
		false

	end
	end
end
