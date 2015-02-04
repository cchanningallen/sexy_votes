class Rating < Issue
  DEFAULT_SCORE_OPTIONS = (1..10).to_a

  default_value_for :score_options, DEFAULT_SCORE_OPTIONS
end
