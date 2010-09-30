class PagesController < ApplicationController
  def home
    @categories = Category.find(:all, :order => "position ASC") 

  end

end
