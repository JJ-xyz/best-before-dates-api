class ItemsController < ApplicationController

#GET /items
def index
    item = Items.all
    render json: items
  end
  





































end
