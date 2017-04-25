require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
####Create new pet####
post('/pet') do
  Tamagotchi.clear()
  new_pet = Tamagotchi.new(params.fetch('name'))
  new_pet.save()
  @name = new_pet.name()
  @food_level = new_pet.food_level()
  @sleep_level = new_pet.sleep_level()
  @activity_level = new_pet.activity_level()
  erb(:pet_home)
end
get('/pet_home') do
  @food_level = Tamagotchi.find(1).food_level()
  @sleep_level = Tamagotchi.find(1).sleep_level()
  @activity_level = Tamagotchi.find(1).activity_level()
  erb(:pet_home)
end
#####Feed Pet######
get('/food') do
  @name = Tamagotchi.find(1).name()
  @food_level = Tamagotchi.find(1).food_level()
  @sleep_level = Tamagotchi.find(1).sleep_level()
  @activity_level = Tamagotchi.find(1).activity_level()
  erb(:food)
end
post('/feed') do
  Tamagotchi.find(1).feed_pet()
  @name = Tamagotchi.find(1).name()
  @food_level = Tamagotchi.find(1).food_level()
  @sleep_level = Tamagotchi.find(1).sleep_level()
  @activity_level = Tamagotchi.find(1).activity_level()
  erb(:food)
#####Taking Nap######
end
get('/sleep') do
  @name = Tamagotchi.find(1).name()
  @food_level = Tamagotchi.find(1).food_level()
  @sleep_level = Tamagotchi.find(1).sleep_level()
  @activity_level = Tamagotchi.find(1).activity_level()
  erb(:sleep)
end
post('/rest_pet') do
  Tamagotchi.find(1).rest_pet()
  @name = Tamagotchi.find(1).name()
  @food_level = Tamagotchi.find(1).food_level()
  @sleep_level = Tamagotchi.find(1).sleep_level()
  @activity_level = Tamagotchi.find(1).activity_level()
  erb(:sleep)
end
#####Playing With Pet######
get('/play') do
  @name = Tamagotchi.find(1).name()
  @food_level = Tamagotchi.find(1).food_level()
  @sleep_level = Tamagotchi.find(1).sleep_level()
  @activity_level = Tamagotchi.find(1).activity_level()
  erb(:play)
end
post('/play_with') do
  Tamagotchi.find(1).play_pet()
  @name = Tamagotchi.find(1).name()
  @food_level = Tamagotchi.find(1).food_level()
  @sleep_level = Tamagotchi.find(1).sleep_level()
  @activity_level = Tamagotchi.find(1).activity_level()
  erb(:play)
end
