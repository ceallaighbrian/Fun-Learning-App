class AddScoreAndLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :level_id, :integer
    add_column :users, :score, :integer
  end
end
