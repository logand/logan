class CreateFeedbackResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :feedback_responses do |t|
      t.timestamps
    end
  end
end
