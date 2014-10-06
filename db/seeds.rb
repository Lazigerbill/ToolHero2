# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do |i|

Tool.create({
  barcode: "Tool#{i}",
  description: "Description#{i}",
  quantity: i,
  notes: i,
  }
)
end

100.times do |i|

Issuance.create({
  employee_id: "Issuance#{i}",
  tool_id: "Issuance#{i}",
  }
)
end

100.times do |i|

Employee.create({
  first_name: "Employee#{i}",
  last_name: "Employee#{i}",
  barcode: "Barcode#{i}",
  }
)
end