class Tamagotchi
 @@all_pets = []
  def initialize(name)
    @name = name
    @food_level = 30
    @sleep_level = 30
    @activity_level = 30
    @id = @@all_pets.length()+(1)
  end
  def self.find(id)
    found_pet = nil
    @@all_pets.each() do |pet|
      if pet.id() == id
        found_pet = pet
      end
    end
    found_pet
  end


  def save
    @@all_pets.push(self)
  end
  def id
    @id
  end
  def name
    @name
  end
  def food_level
    @food_level
  end
  def sleep_level
    @sleep_level
  end
  def activity_level
    @activity_level
  end
  def is_alive?
    @food_level > 0
  end
  def is_awake?
    @sleep_level > 0
  end
  def is_happy?
     @activity_level > 0
  end
  def feed_pet
    @food_level+= 6
    @sleep_level -= 2
    self.time_passes()
  end
  def play_pet
    @activity_level += 6
    @food_level -= 2
    self.time_passes()
  end
  def rest_pet
    @sleep_level += 6
    @activity_level -= 2
    self.time_passes()
  end
  def time_passes
    @food_level -= 2
    @sleep_level -= 2
    @activity_level -= 2
  end
  def food_zero
    @food_level=0
  end
  def self.clear
    @@all_pets = []
  end
end
