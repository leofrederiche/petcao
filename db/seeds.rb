# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

count = 0
fails = 0
success = 0
while(count < 1000) do
	a = Dog.new
	a.breed = "" 
	8.times{a.breed  << (65 + rand(25)).chr}

	a.gender = ""
	if((count % 2) != 0)
		a.gender = "Macho"
		a.castrated = false
	else
		a.gender = "Fêmea"
		a.castrated = true
	end

	a.birth = Time.at(rand * Time.now.to_i)

	a.dog_name = ""
	6.times{a.dog_name  << (65 + rand(25)).chr}

	a.owner_name = ""
	8.times{a.owner_name  << (65 + rand(25)).chr}

	a.tel = "";
	5.times{a.tel << rand(10)}

	if a.save
		puts "#{count} Success!!"
		success = success + 1
	else
		puts "#{count} Fail!!"
		fails = fails + 1
	end

	count = count + 1
end

puts "Total de erros = #{fails}"
puts "Total de registros = #{success}"