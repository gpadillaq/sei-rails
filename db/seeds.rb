# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserType.where(nombre: 'Estudiante').first_or_create!
UserType.where(nombre: 'Docente').first_or_create!
UserType.where(nombre: 'Directivo').first_or_create!

if Admin.all.blank?
  Admin.create!(email: 'sei@sei.com', password: '123123')
end
