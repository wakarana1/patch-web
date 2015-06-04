class User < ActiveRecord::Base
	has_secure_password
	
	validates :name, presence:true
 	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
 	validates :password, presence: true, length: { in: 4..10 }, confirmation: :true

 	attr_reader :password

	#we also need to create an @password instance variable and set it's value in our setter method
	def password=(unencrypted_password)
		unless unencrypted_password.empty?
		@password = unencrypted_password
		self.password_digest = BCrypt::Password.create(unencrypted_password)
		end
	end
	has_many :posts
	has_many :comments
end
