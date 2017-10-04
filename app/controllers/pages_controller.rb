class PagesController < ApplicationController
  def home
    @players = Player.all
  end
end
