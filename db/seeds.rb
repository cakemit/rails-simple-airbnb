Faker::Config.locale = 'pt-BR'

puts "Cleaning all databases"
Flat.destroy_all

puts "Creating 10 flats..."
for i in (1..10) do
  flat = Flat.create!(
    name: [Faker::Book.title, Faker::Book.author].join(' - '),
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    price_per_night: rand(100..1000),
    number_of_guests: rand(1..5))
  puts "Created #{i}. #{flat.name}"
end
puts "Finished"