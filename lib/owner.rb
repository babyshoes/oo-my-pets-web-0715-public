require 'pry'
require 'cat'
require 'dog'
require 'fish'

class Owner
  attr_reader :species, :name
  attr_accessor :name, :pets

  @@owners_of_list = []

  def self.all
    @@owners_of_list
  end

  def self.reset_all
    @@owners_of_list = []
  end

  def self.count
    @@owners_of_list.length
  end

  def initialize(name)
    @name = name
    @species='human'
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@owners_of_list << self
  end

  def say_species
    "I am a human."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
    # binding.pry
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    pets.each do |species|
      species[1].each do |animal|
        # binding.pry
        animal.mood = "nervous"
      end
    end
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."

  end

end