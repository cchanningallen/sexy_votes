class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  has_many :votes

  validates :name, :score_options, :user_id, :team_id, presence: true

  serialize :score_options, Array
end
