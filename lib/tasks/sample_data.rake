require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
    admin = User.create!(:name => "Administrator",
                 :email => "admin@sampleapp5.heroku.com",
                 :password => "000000",
                 :password_confirmation => "000000")
    admin.toggle!(:admin)
    49.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      name = "#{first_name} #{last_name}" 
      email = "#{first_name.downcase}.#{last_name.downcase}@sampleapp5.heroku.com"
      password = "000000"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
end

def make_microposts
    User.all(:limit => 6).each do |user|
      50.times do
        user.microposts.create!(:content => Faker::Lorem.sentence(5))
      end
    end
end

def make_relationships
  users = User.all
  user = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end

