require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Administrator",
                 :email => "admin@sampleapp5.heroku.com",
                 :password => "000000",
                 :password_confirmation => "000000")
    admin.toggle!(:admin)
    99.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      name = "#{first_name} #{last_name}" 
      email = "#{first_name.downcase}#{n+1}.#{last_name.downcase}@sampleapp5.heroku.com"
      password = "000000"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    User.all(:limit => 6).each do |user|
      50.times do
        user.microposts.create!(:content => Faker::Lorem.sentence(5))
      end
    end
  end
end
