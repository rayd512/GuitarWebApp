class Guitar < ApplicationRecord
	belongs_to :user

	def self.search(search)
		if search
			where('brand LIKE :search OR name LIKE :search OR serial LIKE :search', search: "%#{search}%")
		else
			all
		end
	end

	def self.search_by_user(search)
		if search
			where('user_id LIKE :search', search: "%#{search}%")
		else
			all
		end
	end

end
