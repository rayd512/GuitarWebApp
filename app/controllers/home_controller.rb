class HomeController < ApplicationController
  helper_method :random_guitar

  def index
  end

  def random_guitar
  	if !Guitar.first.nil?
  		public_guitars = Guitar.where("public = ?", true)
      guitar = public_guitars.find(public_guitars.pluck(:id).sample)
  	else
  		guitar = nil
  	end
  	guitar
  end
end
