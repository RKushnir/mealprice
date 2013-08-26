class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:edit, :update, :destroy]

  # GET /menu_items
  # GET /menu_items.json
  def index
    @place = find_place(params[:place_id])
    @menu_items = MenuItem.all
  end

  # GET /menu_items/new
  def new
    @place = find_place(params[:place_id])
    @menu_item = @place.menu_items.new
  end

  # GET /menu_items/1/edit
  def edit
  end

  # POST /menu_items
  # POST /menu_items.json
  def create
    @place = find_place(params[:place_id])
    @menu_item = @place.menu_items.new(menu_item_params)

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to @place, notice: 'Позицію додано.' }
        format.json { render action: 'show', status: :created, location: @menu_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_items/1
  # PATCH/PUT /menu_items/1.json
  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to @menu_item.place, notice: 'Зміни збережено.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.json
  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to @menu_item.place }
      format.json { head :no_content }
    end
  end

  private
    def find_place(id)
      Place.find(id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_item_params
      params.require(:menu_item).permit(:place_id, :title, :price)
    end
end
