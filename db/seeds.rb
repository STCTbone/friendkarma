# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    {username: "Matt", first: 'Matt', last: 'Rieger', email: 'matthew.rieger@gmail.com', friend_karma: 0, phone: '8476410915'},
    {username: "Michael", first: 'Michael', last: 'Mahaffey', email: 'mayhaffs@gmail.com', friend_karma: 0, phone: '8475255118'},
    {username: "Shawnna", first: 'Shawnna', last: 'Huang', email: 'shawnaxhuang@gmail.com', friend_karma: 0, phone: '5034700033'}
]


User.destroy_all
User.create!(users)

User.all.each do |user|
    user.change_password!("password")
end


groups = [
    {name: 'Coworkers'},
    {name: 'Family'},
    {name: 'Friends'}

]

Group.destroy_all
Group.create(groups)

memberships = [
    {group_id: 1, user_id: 2},
    {group_id: 3, user_id: 2},
    {group_id: 2, user_id: 2},
    {group_id: 1, user_id: 1},
    {group_id: 1, user_id: 3}
]

Membership.destroy_all
Membership.create(memberships)

jobs = [
    {name: "Groceries", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: 1, membership_id: 1},
    {name: "Coffee", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: 2, membership_id: 3},
    {name: "Laundry", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: 3, membership_id: 2},
    {name: "Office Supplies", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: 1, membership_id: 5},
    {name: "Booze", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: 3, membership_id: 2},
]

Job.destroy_all
Job.create(jobs)

requests = [
    {job_id: 1, membership_id: 5, request_text: "Can you get me some milk?"},
    {job_id: 2, membership_id: 3, request_text: "How about a latte?"},
    {job_id: 3, membership_id: 2, request_text: "My undies are grungy"},
    {job_id: 2, membership_id: 3, request_text: "Double espresso, please."},
    {job_id: 5, membership_id: 2, request_text: "Olde English please."}
]

Request.destroy_all
Request.create(requests)

comments = [
    {comment_text: "Awesome!", membership_id: 5, job_id: 1},
    {comment_text: "Sucks", membership_id: 3, job_id: 2},
    {comment_text: "Gross!", membership_id: 2, job_id: 3},
    {comment_text: "Ok", membership_id: 3, job_id: 2},
    {comment_text: "Tasty!", membership_id: 2, job_id: 5}
]

Comment.destroy_all
Comment.create(comments)
