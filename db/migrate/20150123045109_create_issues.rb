class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :name
      t.text :type
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true

      t.timestamps
    end
  end
end
