# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    {name: 'Matt Rieger', email: 'matthew.rieger@gmail.com', friend_karma: 0},
    {name: 'Michael Mayhaffy', email: 'mayhaffs@gmail.com', friend_karma: 0 },
    {name: 'Shawnna X. Huang', email: 'shawnaxhuang@gmail.com', friend_karma: 0}
]


User.destroy_all
User.create(users)

groups = [
    {name: 'Coworkers'},
    {name: 'Family'},
    {name: 'Friends'}

]

Group.destroy_all
Group.create(groups)

memeberships = [
    {group_id: 1, user_id: 2},
    {group_id: 3, user_id: 2},
    {group_id: 2, user_id: 2},
    {group_id: 1, user_id: 1},
    {group_id: 1, user_id: 3}
]

Membership.destroy_all
Membership.create(memeberships)
