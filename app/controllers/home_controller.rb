class HomeController < ApplicationController
  helper_method :random_guitar

  def index
  end

  def random_guitar
  	if !Guitar.first.nil?
  		guitar = Guitar.where("public = ?", true).find(Guitar.pluck(:id).sample)
  	else
  		guitar = nil
  	end
  	guitar
  end
end
