class Food

  attr_accessor :id, :ingredient, :spice, :measurement

  def initialize(hash)
    @id = hash['id']
    @ingredient = hash['ingredient']
    @spice = hash['spice']
    @measurement = hash['measurement']
  end

  def self.find(id)
    food_hash = Unirest.get("#{ENV['DOMAIN']}/foods/#{id}.json", :headers => {"Accept"=> "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => "{ENV['API_EMAIL']}"}).body
    Food.new(food_hash)
  end

  def self.all
    food_hashes = Unirest.get("#{ENV['DOMAIN']}/foods.json", :headers => {"Accept"=> "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => "{ENV['API_EMAIL']}"}).body
    foods = []
    food_hashes.each do |food_hash|
      foods << Food.new(food_hash)
    end
    return foods
  end

  def self.create(parameters)
    food_hash = Unirest.post("#{ENV['DOMAIN']}/foods.json", :headers => {"Accept"=> "application/json"}, :parameters => parameters)
     @food = Food.new(@food_hash)
  end

  def self.update(parameters)
    food_hash = Unirest.post("#{ENV['DOMAIN']}/foods.json", :headers => {"Accept"=> "application/json"}, :parameters => parameters)
     @food = Food.new(@food_hash)
  end


  def destroy
    food_hash = Unirest.delete("#{ENV['DOMAIN']}/foods/#{id}.json").body
  end

end