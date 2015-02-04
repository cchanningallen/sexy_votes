class AddScoreOptionsToIssue < ActiveRecord::Migration
  def up
    add_column :issues, :score_options, :text
  end

  def down
    remove_column :issues, :score_options
  end
end
