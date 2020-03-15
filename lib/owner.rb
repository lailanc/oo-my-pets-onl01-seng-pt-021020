'require pry'

class Owner
  @@all = []
  
  attr_reader :name, :species
  
  def initialize(name)
    @name = name 
    @species = "human"  
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.count
    self.all.count 
  end 
  
  def self.reset_all
    self.all.clear 
  end
   
   def say_species
     "I am a #{self.species}."
   end 
   
   def dogs 
     Dog.all.find_all {|dog_object| dog_object.owner == self}
   end 
   
   def cats 
     Cat.all.find_all {|cat_object| cat_object.owner == self}
   end 
   
   def buy_cat(new_cat)
     Cat.new(new_cat, self)
   end 
   
   def buy_dog(new_dog)
     Dog.new(new_dog, self)
   end 
   
   def walk_dogs
     self.dogs.each {|dog| dog.mood = "happy"}
   end
   
   def feed_cats
     self.cats.each {|cat| cat.mood = "happy"}
   end 
   
   def sell_pets
     pets = self.cats + self.dogs 
     pets.each do |pet|
       pet.mood = "nervous"
       pet.owner = nil 
     end 
     
   end 
   
   def list_pets
     "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
   end 
   
   
end