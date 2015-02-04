class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.text :score
      t.belongs_to :user, index: true
      t.belongs_to :issue, index: true

      t.timestamps
    end
  end
end
