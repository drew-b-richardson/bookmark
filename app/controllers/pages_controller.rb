class PagesController < ApplicationController
  def home
   categories = Category.find(:all, :order => "position DESC") 
   i = 0
   @left = []
   @right = []

   categories.each do |cat| 
     if i%2 == 0
        @left << cat
     else
       @right << cat
     end
     i += 1
     end
  end

end
