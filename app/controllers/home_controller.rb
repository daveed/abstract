class HomeController < ApplicationController
  def index
    @discussions = Discussion.all
  end
end
