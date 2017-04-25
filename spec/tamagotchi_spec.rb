require('rspec')
require('tamagotchi')


describe(Tamagotchi) do
  before() do
    Tamagotchi.clear()
  end
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(30))
      expect(my_pet.sleep_level()).to(eq(30))
      expect(my_pet.activity_level()).to(eq(30))
    end
  end
  describe("#is_alive") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive?()).to(eq(true))
    end
    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.food_zero()
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 2") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes()  #decide what trigger you will use to make time pass
      expect(my_pet.food_level()).to(eq(28))
    end
  end
  describe("#rest_pet") do
    it("increases the amount of sleep_level the Tamagotchi has left by 2") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.rest_pet()
      expect(my_pet.sleep_level()).to(eq(32))
    end
  end
  describe("#feed_pet") do
    it("increases the amount of food_level the Tamagotchi has left by 2") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.feed_pet()
      expect(my_pet.food_level()).to(eq(32))
    end
  end
  describe("#id") do
    it("returns the id of the pet") do
      my_pet = Tamagotchi.new('name')
      my_pet.save()
      my_pet2 = Tamagotchi.new('name')
      my_pet2.save()
      expect(my_pet2.id()).to(eq(2))
    end
  end
  describe(".find") do
  it("returns a pet by its id number") do
    my_pet = Tamagotchi.new('tiny')
    my_pet.save()
    my_pet2 = Tamagotchi.new('buffy')
    my_pet2.save()
    expect(Tamagotchi.find(my_pet.id())).to(eq(my_pet))
  end
end
end
