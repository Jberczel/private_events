namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_events
    make_attendance
  end
end

def make_users
  User.create!(name: "Thor",
                 email: "thor@email.com")
  10.times do |n|
    name  = Faker::Name.name
    email = Faker::Internet.free_email(name.split.first)
    User.create!(name: name,
                 email: email)
  end
end

def make_events
  users = User.all(limit: 5)
  2.times do
    users.each do |user|
      desc = Faker::Lorem.paragraph(4)
      title = "#{Faker::Company.name}'s event"
      date = rand_date
      location = Faker::Address.street_address
      user.events.create!(description: desc, title: title,
                          date: date, location: location)
    end
  end
end

def rand_date
  random_year = Random.new.rand(2013..2015) # custom range for years
  random_month =Random.new.rand(1..12)
  random_day  = Random.new.rand(1..28)
  Date.new(random_year,random_month,random_day)
end

def make_attendance
  users = User.all
  events = Event.all

  users.each do |user| 
    i = rand_int(1,10) 
    i.times do
      rand_event = events[rand_int(0,9)]
      user.attend!(rand_event) unless user.attending?(rand_event)
    end
  end

end

def rand_int(from, to)
  num = Random.new
  num.rand(from..to)
end



