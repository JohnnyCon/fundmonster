require 'csv'

task :campaigns => :environment do

  csv_text = File.read("campaigns_mock_data.csv")
  csv = CSV.parse(csv_text, :headers => true)

  users       = User.order(:id).limit(10)
  users_index = 0

  csv.each do |row|
    campaign = row.to_hash

    end_at = Date.tomorrow + Random.rand(40).days

    Campaign.create(
          title:        campaign["title"],
          description:  campaign["description"],
          goal:         campaign["goal"],
          image:        campaign["image"],
          user:         users[users_index],
          end_at:       end_at,
        )

    users_index += 1

    print "."
  end

  puts " "
  puts "-----------------------"
  puts "completed campaigns import"


end
