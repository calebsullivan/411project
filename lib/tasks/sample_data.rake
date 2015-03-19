
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_user
    make_tweets
    make_relationships
  end
end

def make_user
  User.create!(name: "Toshi",
               email: "me@toshimaru.net",
               password: "foobar",
               password_confirmation: "foobar",
               slug: "toshi")

  (1..100).each do |n|
    name  = Faker::Name.name
    slug  = name.parameterize
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 slug: slug)
  end
end

def make_tweets
  users = User.all
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.tweets.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
