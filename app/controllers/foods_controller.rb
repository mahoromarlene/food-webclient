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
    @food = Unirest.post("#{ENV['DOMAIN']}/foods.json", :headers => {"Accept" => "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement => params[:measurement]}).body
    redirect_to "/foods/#{@food['id']}"
  end

  def edit
    @food = Unirest.get("#{ENV['DOMAIN']}/foods/#{params[:id]}.json").body
  end

  def update
    @food = Unirest.patch("#{ENV['DOMAIN']}/foods.json", :headers => {"Accept" => "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement => params[:measurement]}).body
    redirect_to "/foods/#{@food['id']}"
  end

  def destroy
    @food = Unirest.delete("#{ENV['DOMAIN']}/foods/#{params[:id]}.json").body
    redirect_to "/foods"
  end

end
