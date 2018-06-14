require 'rails_helper'

RSpec.describe "feedback_questions#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/feedback_questions", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'feedback_questions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        make_request
      }.to change { FeedbackQuestion.count }.by(1)
      feedback_question = FeedbackQuestion.last

      assert_payload(:feedback_question, feedback_question, json_item)
    end
  end
end
