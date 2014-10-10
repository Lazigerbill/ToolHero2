# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# InventoryType.create({name: "Bulk"})
# InventoryType.create({name: "Consumable"})
InventoryType.create({name: "Serialized"})

# serialized_inventory = InventoryType.find_or_create_by_name 'Serialized'
# inventory_type = serialized_inventory
# inventory_type.save

