# The page to control the garage
class GarageController < ApplicationController
  def index; end

  def create
    pubsub = PubSub.new
    pubsub.publish('open', to_channel: 'garage')
  end
end
