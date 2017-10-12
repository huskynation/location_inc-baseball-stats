class PagesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def home
    @players ||= Player.order(sort).paginate(:page => params[:page], :per_page => 25)
      respond_to do |format|
        format.html
        format.js
      end
  end
  
private

  def sort_column
    params[:sort] || "avg"
  end
  
  def sort_direction
    params[:direction] || "DESC"
  end
  
  def default_sort
    "avg DESC"
  end
  
  def dynamic_sort
    "#{sort_column} #{sort_direction}"
  end
  
  def sort
    if params[:sort].present? && params[:direction].present?
      dynamic_sort
    else
      default_sort
    end
  end
end