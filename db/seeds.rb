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
    {group_id: Group.find_by_name('Coworkers').id, user_id: User.find_by_username("Matt").id},
    {group_id: Group.find_by_name('Family').id, user_id: User.find_by_username("Michael").id},
    {group_id: Group.find_by_name('Friends').id, user_id: User.find_by_username("Shawnna").id},
    {group_id: Group.find_by_name('Coworkers').id, user_id: User.find_by_username("Matt").id},
    {group_id: Group.find_by_name('Family').id, user_id: User.find_by_username("Michael").id}
]

Membership.destroy_all
Membership.create(memberships)

jobs = [
    {name: "Groceries", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: Group.find_by_name('Coworkers').id, membership_id: Membership.where("group_id = ? AND user_id = ?",Group.find_by_name('Coworkers').id, User.find_by_username("Matt").id ).first.id},
    {name: "Coffee", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: Group.find_by_name('Family').id, membership_id: Membership.where("group_id = ? AND user_id = ?",Group.find_by_name('Family').id, User.find_by_username("Michael").id).first.id},
    {name: "Laundry", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: Group.find_by_name('Friends').id, membership_id: Membership.where("group_id = ? AND user_id = ?",Group.find_by_name('Friends').id, User.find_by_username("Shawnna").id).first.id},
    {name: "Office Supplies", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: Group.find_by_name('Coworkers').id, membership_id: Membership.where("group_id = ? AND user_id = ?",Group.find_by_name('Coworkers').id, User.find_by_username("Matt").id).first.id},
    {name: "Booze", friend_karma_value: 1, time: (Time.now + rand(24.hours)), group_id: Group.find_by_name('Family').id, membership_id: Membership.where("group_id = ? AND user_id = ?",Group.find_by_name('Family').id, User.find_by_username("Michael").id).first.id},
]

Job.destroy_all
Job.create(jobs)

requests = [
    {job_id: Job.find_by_name("Groceries").id, membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Coworkers'), User.find_by_username("Matt")).first.id, request_text: "Can you get me some milk?"},
    {job_id: Job.find_by_name("Coffee").id, membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Family'), User.find_by_username("Michael")).first.id, request_text: "How about a latte?"},
    {job_id: Job.find_by_name("Laundry").id, membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Friends'), User.find_by_username("Shawnna")).first.id, request_text: "My undies are grungy"},
    {job_id: Job.find_by_name("Office Supplies").id, membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Coworkers'), User.find_by_username("Matt")).first.id, request_text: "Double espresso, please."},
    {job_id: Job.find_by_name("Booze").id, membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Family'), User.find_by_username("Michael")).first.id, request_text: "Olde English please."}
]

Request.destroy_all
Request.create(requests)

comments = [
    {comment_text: "Awesome!", membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Coworkers'), User.find_by_username("Matt")).first.id, job_id: Job.find_by_name("Groceries").id},
    {comment_text: "Sucks", membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Family'), User.find_by_username("Michael")).first.id, job_id: Job.find_by_name("Coffee").id},
    {comment_text: "Gross!", membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Friends'), User.find_by_username("Shawnna")).first.id, job_id: Job.find_by_name("Laundry").id},
    {comment_text: "Ok", membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Coworkers'), User.find_by_username("Matt")).first.id, job_id: Job.find_by_name("Office Supplies").id},
    {comment_text: "Tasty!", membership_id: Membership.where("group_id = ? AND user_id = ?", Group.find_by_name('Family'), User.find_by_username("Michael")).first.id, job_id: Job.find_by_name("Booze").id}
]

Comment.destroy_all
Comment.create(comments)
