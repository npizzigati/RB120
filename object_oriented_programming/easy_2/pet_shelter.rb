# Pet Shelter
# Consider the following code:

class Pet
  attr_reader :type, :name
  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.size
  end

  def adopt_pet(pet)
    @pets << pet
  end

  def print_number_of_adopted_pets
    first_part = "#{@name} has #{number_of_pets} adopted pet"
    final_part = number_of_pets > 1 ? 's.' : '.'
    first_part + final_part
  end
end

class Shelter
  def initialize
    @adoptions = {}
    @pets_for_adoption = []
  end

  def adopt(owner, pet)
    @pets_for_adoption.delete(pet)
    owner.adopt_pet(pet)
    if @adoptions[owner]
      @adoptions[owner] << pet
    else
      @adoptions[owner] = [pet]
    end
  end

  def put_pets_up_for_adoption(*pets)
    pets.each do |pet|
      @pets_for_adoption << pet
    end
  end

  def print_pets_up_for_adoption
    puts "The Animal Shelter has the following unadopted pets:"
    @pets_for_adoption.each do |pet| 
      puts "a #{pet.type} named #{pet.name}"
    end
  end

  def print_number_of_adoptable_pets
    first_part = "The Animal Shelter has #{@pets_for_adoption.size} " \
                 "unadopted pet"
    final_part = @pets_for_adoption.size > 1 ? 's.' : '.'
    first_part + final_part
  end

  def print_adoptions
    @adoptions.keys.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      print_pets(@adoptions[owner])
      print_space
    end
  end

  def print_space
    puts ''
  end

  def print_pets(pets)
    pets.each do |pet|
      puts "a #{pet.type} named #{pet.name}"
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
katana       = Pet.new('cat', 'Katana')

asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
npizzigati = Owner.new('N Pizzigati')

shelter = Shelter.new

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(npizzigati, katana)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts npizzigati.print_number_of_adopted_pets

shelter.put_pets_up_for_adoption(asta, laddie, fluffy, kat, ben,
                                 chatterbox, bluebell)
shelter.print_pets_up_for_adoption
shelter.print_number_of_adoptable_pets
# Write the classes and methods that will be necessary to make this code
# run, and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The order of the output does not matter, so long as all of the
# information is presented.

# Further exploration

# Add your own name and pets to this project.

# Suppose the shelter has a number of not-yet-adopted pets, and wants to
# manage them through this same system. Thus, you should be able to add
# the following output to the example output shown above:

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
#    ...

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.
# Can you make these updates to your solution? Did you need to change
# your class system at all? Were you able to make all of your changes
# without modifying the existing interface?
