class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    
  end

  def create
    @food = Food.create(params[:id], params[:ingredient], params[:spice], params[:measurement])
    redirect_to "/foods/#{@food['id']}"
  end

  def edit
    @food = Unirest.get("#{ENV['DOMAIN']}/foods/#{params[:id]}.json").body
  end

  def update
    @food = Food.update(params[:id], params[:ingredient], params[:spice], params[:measurement])
    redirect_to "/foods/#{@food['id']}"
  end

  def destroy
    food = Food.delete(params[:id])
    redirect_to "/foods"
  end

end
