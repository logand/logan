class CreateFeedbackAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :feedback_answers do |t|
      t.belongs_to :feedback_question
      t.belongs_to :feedback_response
      t.string :answer
      t.timestamps
    end
  end
end
