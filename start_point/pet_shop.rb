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

def increase_pets_sold(pet_shop, amount)
  return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  pets = []
  for pet in pet_shop[:pets]
    pets << pet if pet[:breed] == breed
  end
  return pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    return pet if name == pet[:name]
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    pet_shop[:pets].delete(pet) if name == pet[:name]
  end
  return nil
end

def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets] << pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer,pet)
  customer[:pets] << pet
end

#OPTIONAL

def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price]
end


def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    increase_pets_sold(pet_shop, 1)
    add_pet_to_customer(customer,pet)
    remove_pet_by_name(pet_shop, pet[:name])
    add_or_remove_cash(pet_shop, pet[:price])
    remove_customer_cash(customer, pet[:price])
  end
end
