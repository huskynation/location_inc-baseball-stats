class PagesController < ApplicationController
  def home
    @players ||= Player.order(params[:sort])
    @batting_average ||= nil
  end
end
