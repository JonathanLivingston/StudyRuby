# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
LineItem.delete_all
Cart.delete_all
Product.create(title: 'Learning Ruby',
  description: 
    %{<p>
    Ruby is the fastest growing and most exciting dynamic language
    out there. If you need to get working programs delivered fast,
    you should add Ruby to your toolbox.
    </p>},
  image_url: 'rails.png',
  price: 49.95)
Product.create(title: 'Java',
  description: 
    %{<p>
    Perhaps, the best programming language ever known 
    </p>},
  image_url: 'rails.png',
  price: 99.99)
Product.create(title: 'Happiness',
  description: 
    %{<p>
    Is it real?
    </p>},
  image_url: 'rails.png',
  price: 0.01)

