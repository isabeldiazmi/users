class User < ActiveRecord::Base
	# Implementa los métodos y validaciones de tu modelo aquí. 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}\z/i
	validates :email, :uniqueness => true
	validates :email, :presence => true
	validates :email, :format => { :with => VALID_EMAIL_REGEX, :message => "invalid email" }
 	validates :age, :numericality => {:greater_than_or_equal_to => 18}
 	validates :number, :length => {:minimum => 10}
 	validate :phone_min_char
 	# validate :valid_phone

	# def valid_phone
	# 	if phone.split(/\D/).join.length < 10
	# 		errors.add(:phone, "incorrect phone")
	# 		false
	# 	end
	# end

	def phone_min_char
		errors.add(:phone, "incorrect phone") unless phone && phone.count('0123456789') >= 10
	end

	def name
		"#{first_name} #{last_name}"
	end 
	
	def age
		now = Date.today
		now.year - birthday.year
	end
end
