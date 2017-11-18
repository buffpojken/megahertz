require 'faker'

100.times do 

  Program.create({
    :title        => Faker::Book.title, 
    :duration     => rand(10...120), 
    :description  => Faker::Coffee.notes
  })


end