class FistOfFive < Issue
  SCORE_OPTIONS = (1..5).to_a

  before_create do
    score_options = SCORE_OPTIONS
  end
end
