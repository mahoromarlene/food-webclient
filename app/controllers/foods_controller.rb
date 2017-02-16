class FoodsController < ApplicationController

  def index
    @foods = Unirest.get("http://localhost:3000/api/v2/foods.json").body
  end

  def show
    @food = Unirest.get("http://localhost:3000/api/v2/foods/#{params[:id]}.json").body
  end

  def new
    
  end

  def create
    @food = Unirest.post("http://localhost:3000/api/v2/foods.json", :headers => {"Accept" => "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement => params[:measurement]}).body
    redirect_to "/foods/#{@food['id']}"
  end

end
