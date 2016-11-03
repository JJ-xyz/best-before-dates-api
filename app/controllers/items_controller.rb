class ItemsController < ApplicationController
  #GET /api/items
  def index
    items = Items.all
    render json: items
  end
end
