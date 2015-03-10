class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :required_score

      t.timestamps null: false
    end
  end
end
