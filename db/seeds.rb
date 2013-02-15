# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names = [
    {name: 'Matt Rieger'},
    {name: 'Michael Mayhaffy'},
    {name: 'Shawnna X. Huang'}
]

emails = [
    {email: 'matthew.rieger@gmail.com'},
    {email: 'mayhaffs@gmail.com'},
    {email: 'shawnaxhuang@gmail.com'}
]

friend_karmas = [0,0,0]

User.destroy_all
User.create(names, emails, friend_karmas)
