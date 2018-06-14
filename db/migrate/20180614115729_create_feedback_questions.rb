class CreateFeedbackQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :feedback_questions do |t|
      t.timestamps
    end
  end
end
