# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = City.create([{name: 'Florence', country_id: 2}, {name: 'Naples', country_id: 2}, {name: 'Paris', country_id: 3}, {name: 'Austin', country_id: 1, state_id: 4}, {name: 'Naples', country_id: 1, state_id: 1}])
countries = Country.create([{name: 'United States'}, {name: 'Italy'}, {name: 'France'}])
states = State.create([{name: 'Florida', country_id: 1}, {name: 'Alaska', country_id: 1}, {name: 'Alabama', country_id: 1}, {name: 'Texas', country_id: 1}])
reviews = Review.create([{user_id: 1, city_id: 1, country_id: 2, title: 'Ciao Bella', content: 'Lovely trip to visit Florence for two weeks. Stayed in two air bnb. Ate wonderful food, etc.'}])
reviews = Review.create([{user_id: 1, city_id: 4, country_id: 1, state_id: 4, title: 'title test', content: 'content test'}])