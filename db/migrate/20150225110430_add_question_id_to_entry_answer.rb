class AddQuestionIdToEntryAnswer < ActiveRecord::Migration
  def change
    add_column :entry_answers, :question_id, :integer
  end
end
