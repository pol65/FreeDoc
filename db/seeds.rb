# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all
City.destroy_all

cities = []
10.times do
  cities << City.create(
        name: Faker::Movies::LordOfTheRings.location
  )
end

doctors = []
25.times do
  doctors << Doctor.create(
      first_name: Faker::Ancient.hero, 
      last_name: Faker::Name.last_name, 
      specialty: Faker::Educator.subject, 
      zip_code: Faker::Address.zip_code,
      city: cities.sample
  )
end
patients = []
100.times do
    patients << Patient.create(
        first_name: Faker::Games::Heroes.name,
        last_name: Faker::Games::ElderScrolls.last_name,
        city: cities.sample
    )
  end
  
  150.times do
      Appointment.create(
          date: Faker::Time.forward(days: 100, period: :day),
          doctor: doctors.sample,
          patient: patients.sample,
          city: cities.sample
      )
    end

puts "Ayé, c'est prêt"