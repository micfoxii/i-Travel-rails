# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = City.create([{name: 'Florence'}, {name: 'Naples'}, {name: 'Paris'}, {name: 'Austin'}])
countries = Country.create([{name: 'United States'}, {name: 'Italy'}, {name: 'France'}])
states = State.create([{name: 'Alaska', country_id: '1'}, {name: 'Alabama', country_id: '1'}, {name: 'Texas', country_id: '1'}])