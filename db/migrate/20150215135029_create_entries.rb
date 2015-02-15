class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.timestamps null: false
    end

    create_table :entry_answers do |t|
      t.integer :entry_id, null: false
      t.integer :answer_id,null: false
    end

  end
end
