class PagesController < ApplicationController
  def home
    @players ||= Player.order(params[:sort], "avg DESC").paginate(:page => params[:page], :per_page => 25)
    @batting_average ||= nil
  end
end