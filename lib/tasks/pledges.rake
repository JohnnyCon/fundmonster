require 'csv'

task :pledges => :environment do

  campaigns = Campaign.all

  (1..3).each do |i|

    User.all.each do |user|
      pledge = Random.rand(500)

      campaign_index = Random.rand(10)
      campaign = campaigns[campaign_index]

      Pledge.create(
          campaign: campaign,
          user: user,
          pledge: pledge
      )

      print "."
    end

    puts ""
    puts "completed a round"
  end


  puts "--------------"
  puts "sum pledges"
  campaigns.each do |campaign|
    pledged = Pledge.where(campaign: campaign).sum(:pledge)

    campaign.update(pledged: pledged)

    print "."
  end

  puts " "
  puts "-----------------------"
  puts "completed pledge import"
end
