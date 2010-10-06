class PagesController < ApplicationController
  def home
   categories = Category.find(:all, :order => "position ASC") 
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

  def add_link

  end

  def destroy_link
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(links_url) }
      format.xml  { head :ok }
    end
  end
end
