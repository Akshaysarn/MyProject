class User < ActiveRecord::Base

  attr_accessor :password
#  attr_accessible :name, :email, :password, :password_confirmation


 # validates :name, :present => true,
	#    :length	    => { :maximum => 50 }
#  validates :email, :present => true,
#	    :format	     => { :with => email_regex },
#	    :uniqueness	     => { :case_sensitive => false }
 # validates :password, :presence => true,
  #          :confirmation      => true,
   #         :length            => { :within => 6..40 }

  before_save :encrypt_password

  def has_password(submitted_password)
	encrypted_password == encrypt(submitted_password)
  end

  def self.validate(email,password)
	user = find_by_email(email)
	return nil if user.nil?
	return user
  end


  def self.authenticate(email,submitted_password)
	user = find_by_email(email)
	return nil if user.nil?
	return user if user.has_password?submitted_password
  end

  private
	def encrypt_password
		#self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}" 
		#self.encrypted_password = encrypt(password)
		self.salt = "" 
		self.encrypted_password = encrypt(password)
    end

	def encrypt(pass)
		pass
	end
  	
		
end