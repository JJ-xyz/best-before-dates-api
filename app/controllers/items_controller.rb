class ItemsController < ApplicationController
#GET /items
def index
    item = Items.all
    render json: items
  end






































=======
  #GET /api/items
  def index
    items = Items.all
    render json: items
  end
>>>>>>> 00b9725366a6bdebe1337a3a8f87c89eadf5352a
end
