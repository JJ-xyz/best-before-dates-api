class ItemsController < ApplicationController
#GET /items
def index
    items = Item.all
    render json: items
  end

  #GET /items/1
  def show
  item = Item.find(params[:id])
  render json: item
  end

    # POST /items
  def create
    item = Item.new(item_params)
    puts(item_params)

    if item.save
      render json: item, status: :created, location: item
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

    # DELETE /api/items/1
  def destroy
    item = Item.find(params[:id])
    item.destroy

    render json: {status: 204}
  end

  private
    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name, :exp_date, :date_purchased, :description, :where_to_buy, :rating, :upc, :in_use, :household_id)
    end
end
