require 'csv'

task :users => :environment do

  csv_text = File.read("users_mock_data.csv")
  csv = CSV.parse(csv_text, :headers => true)

  csv.each do |row|
    user = row.to_hash
    name     = "#{user['first_name']} #{user['last_name']}"
    username = name.downcase.gsub(" ", "_")
    avatar   = "https://robohash.org/#{username}"

    User.create(
          name: name,
          username: username,
          email: user["email"],
          avatar: avatar
          )

    print "."
  end

  puts " "
  puts "-----------------------"
  puts "completed users import"


end
