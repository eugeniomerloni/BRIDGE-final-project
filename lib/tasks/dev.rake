desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  x = User.new
  x.first_name = "Lavinia"
    x.last_name = "Cavalet"
    x.dob = "February 18, 2001"
    x.hometown = "Chicago"
    x.email = "lavinia.cavalet@example.com"
  
    x.save

  x = User.new
  x.first_name = "Eugenio"
  x.last_name = "Merloni"
  x.dob = "January 2, 2002"
  x.hometown = "New York"
  x.email = "eugenio.merloni@example.com"
    
  x.save

  50.times do
    x = User.new
    x.first_name = Faker::Name.first_name
    x.last_name = Faker::Name.last_name
    x.dob = Faker::Date.birthday(min_age: 0, max_age: 120)
    x.hometown = Faker::Address.city
    x.email = "#{x.first_name}.#{x.last_name}@example.com"
  
    x.save

  end

  #CATEGORIES

  x = Category.new
  x.name = "Fine Dining"

  x.save

  x = Category.new
  x.name = "Fast Food"
  
  x.save

  x = Category.new
  x.name = "Pizzeria"
  
  x.save

  x = Category.new
  x.name = "Bistrot"
  
  x.save

  x = Category.new
  x.name = "Diner"
  
  x.save

  x = Category.new
  x.name = "Pub"
  
  x.save

  x = Category.new
  x.name = "Cafe"
  
  x.save

  x = Category.new
  x.name = "Family Restaurant"
  
  x.save

  x = Category.new
  x.name = "Bar"
  
  x.save

  x = Category.new
  x.name = "Steakhouse"
  
  x.save

 #PLACES

 x = Place.new
 x.name = "Small Cheval"
 x.street_address = "1307 E 53rd St"
 x.city = "Chicago"
 x.zip_code = "60615"
 
 x.save


 x = Place.new
 x.name = "Mortons"
 x.street_address = "65 E Wacker Pl"
 x.city = "Chicago"
 x.zip_code = "60601"
 
 x.save
  
 x = Place.new
 x.name = "Noodles Etc."
 x.street_address = "1333 E 57th St"
 x.city = "Chicago"
 x.zip_code = "60637"
 
 x.save
  
  
end
