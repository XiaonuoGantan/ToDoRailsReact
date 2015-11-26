class ToDoItemsController < ApplicationController

  def index
    @items = ToDoItem.all
  end

  def create
    @item = ToDoItem.new(item_params)

    if @item.save
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    @item = ToDoItem.find(params[:id])
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item = ToDoItem.find(params[:id])
    @item.destroy
    head :no_content
  end

  private

    def item_params
      params.require(:item).permit(:entry, :due_at)
    end

end
