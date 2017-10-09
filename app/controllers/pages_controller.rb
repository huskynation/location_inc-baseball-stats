class PagesController < ApplicationController
  def home
    @players ||= Player.order(sort_column + " " + sort_direction, "avg DESC").paginate(:page => params[:page], :per_page => 25)
    @batting_average ||= nil
      respond_to do |format|
        format.html
        format.js
      end
  end
  
private

def sort_column
  params[:sort] || "name"
end

def sort_direction
  params[:direction] || "asc"
end

end