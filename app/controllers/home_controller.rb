class HomeController < ApplicationController
  def index
  	if !Guitar.first.nil?
  		@guitar = Guitar.where("public = ?", true).find(Guitar.pluck(:id).sample)
  		@user = @guitar.user
  		print(@user)
  	else
  		@guitar = nil
  	end
  end
end
