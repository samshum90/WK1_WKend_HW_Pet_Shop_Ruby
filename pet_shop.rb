# def pet_shop_name(pet_shop)
# return pet_shop.find { |pet_shop| pet_shop[:name] == "Camelot of Pets"}
# end
#
# def pet_shop_name(pet_shop)
#   return pet_shop.each { |shop_name| shop_name[:name] }
# end

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number)
  pet_shop[:admin][:pets_sold] += number
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

# def pets_by_breed(pet_shop, breed_of_dog)
#   pets = pet_shop.select { |breed| breed[:pets][:breed] == (breed_of_dog) }
#   return pets
# end

def pets_by_breed(pet_shop, breed_of_dog)
  pets_by_breed_array = []
  for pet in pet_shop[:pets]
    pets_by_breed_array.push(pet) if pet[:breed] == breed_of_dog
  end
  return pets_by_breed_array
end

def find_pet_by_name(pet_shop, pet_name)
  pets_by_name_array = []
  for pet in pet_shop[:pets]
      return pet if pet[:name] == pet_name
    end
    return nil
end

def remove_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop, name))
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customers)
  return customers[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customers)
  return customers[:pets].count
end

def add_pet_to_customer(customer, pet)
  return customer[:pets] << pet
end

def customer_can_afford_pet(customer, pet)
  if customer[:cash] >= pet[:price]
    return true
  else
    return false
  end
end

# if the customer can afford
# add one pet to customer[0]
# add one pet sold to admin
# remove pet price from customer
#  add the pet price into admin total cash
def sell_pet_to_customer(pet_shop, pet, customer)

 if pet == nil || customer_can_afford_pet(customer, pet) == false
   return
 else
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop,1)
    add_or_remove_cash(pet_shop, pet[:price])
    remove_pet_by_name(pet_shop, pet[:name])
    customer[:cash] -= pet[:price]
  end
end
