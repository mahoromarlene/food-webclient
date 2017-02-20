class Food

  attr_accessor :id, :ingredient, :spice, :measurement

  def initialize(hash)
    @id = hash['id']
    @ingredient = hash['ingredient']
    @spice = hash['spice']
    @measurement = hash['measurement']
  end

  def self.find(id)
    food_hash = Unirest.get("#{ENV['DOMAIN']}/foods/#{id}.json").body
    Food.new(food_hash)
  end

  def self.all
    food_hashes = Unirest.get("#{ENV['DOMAIN']}/foods.json").body
    foods = []
    food_hashes.each do |food_hash|
      foods << Food.new(food_hash)
    end
  end

end