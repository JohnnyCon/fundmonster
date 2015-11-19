class User < ActiveRecord::Base
  has_many :campaigns
  has_many :pledges
end
