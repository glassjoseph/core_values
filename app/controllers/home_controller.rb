class HomeController < ApplicationController


  def index
  end

  def new
    @daily = Daily.new
  end

end
