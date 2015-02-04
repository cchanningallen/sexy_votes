# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

organizations = Organization.create([
  {name: "CrowdFlower"},
  {name: "Best Apartment Ever!"},
])
ap "Created organizations: #{organizations}"

# Crowdflower teams
cf_teams = organizations.first.teams.create([
  {name: "Sexy Votes Test Squad"},
  {name: "Sexy Votes Devs"},
])
ap "Created cf_team: #{cf_teams}"

# Apartment team
apt_team = organizations.second.teams.create({name: "The Four Musketeers"})
ap "Created apt_team: #{apt_team}"

cf_users = User.create([
  {email: "channing.allen@crowdflower.com", name: "Channing Allen"},
  {email: "bryan.orourke@crowdflower.com", name: "Bryan O'Rourke"},
  {email: "miran.bresic@crowdflower.com", name: "Miran Bresic"},
])
ap "Created CF Users: #{cf_users}"

# "Sexy Votes Test Squad" memberships
team_memberships = TeamMembership.create([
  {user: cf_users[0], team: cf_teams[0]},
  {user: cf_users[1], team: cf_teams[0]},
  {user: cf_users[2], team: cf_teams[0]},
])
ap "Created TeamMemberships: #{team_memberships}"

# "Sexy Votes Devs" memberships
team_memberships = TeamMembership.create([
  {user: cf_users[0], team: cf_teams[1]},
  {user: cf_users[1], team: cf_teams[1]},
])
ap "Created TeamMemberships: #{team_memberships}"

apt_users = User.create([
  {email: "cchanningallen@gmail.com", name: "Channing Allen"},
  {email: "kyle.olney@gmail.com", name: "Kyle Olney"},
  {email: "neenadolwani@gmail.com", name: "Neena Dolwani"},
])
ap "Created Apt Users: #{apt_users}"

# "The Four Musketeers" memberships
team_memberships = TeamMembership.create([
  {user: apt_users[0], team: apt_team},
  {user: apt_users[1], team: apt_team},
  {user: apt_users[2], team: apt_team},
])
ap "Created TeamMemberships: #{team_memberships}"

issue_types_and_values = {
  rating:         -> { (1..10).to_a },
  fist_of_five:   -> { (1..5).to_a },
  choice:         -> do
    (1..rand(1..5)).to_a.each_with_object([]) do |_, choices|
      choices << Faker::Company.bs
    end
  end,
}

# Create issues
issues = (cf_users + apt_users).each_with_object([]) do |user, issues|
  rand(0..3).times do
    type = issue_types_and_values.keys.sample
    issue = Issue.create(
      user: user,
      team: user.teams.offset(user.teams.count).first,
      type: type.to_s,
      score: issue_types_and_values[type],
    )
    ap "Created issue: #{issue}"
    issues << issue
  end
end

# Create votes
issues.each do |issue|
  possible_voters = issue.team.users
  voters = possible_voters.offset(rand(0..possible_voters.count))
            .first(rand(0..possible_voters.count))

  voters.each do |voter|
    vote = Vote.create(user: voter, issue: issue)
    ap "Created Vote: #{vote} for Issue: #{issue}"
  end
end
