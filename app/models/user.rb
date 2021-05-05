class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  		 has_many :guitars

	def self.search(search)
		if search
			where('name LIKE :search', search: "%#{search}%")
		else
			all
		end
	end

end
