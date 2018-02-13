# The page to control the garage
class GarageController < ApplicationController
  def index; end

  def create
    api = GarageAPI.new
    api.open
  end
end
