class User < ActiveRecord::Base
  has_many :teams, :through => :team_memberships
  has_many :team_memberships
  has_many :issues
  has_many :votes
end
