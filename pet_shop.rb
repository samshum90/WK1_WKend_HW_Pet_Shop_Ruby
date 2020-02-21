pet_shop_name(pet_shop)
name = pet_shop.find { |name| pet_shop[:name] == "Camelot of Pets" }
return name
end
