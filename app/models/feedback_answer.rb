class FeedbackAnswer < ApplicationRecord
  belongs_to :feedback_response
  belongs_to :feedback_question
end
