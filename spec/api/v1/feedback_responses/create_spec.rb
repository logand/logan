require 'rails_helper'

RSpec.describe "feedback_responses#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/feedback_responses", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'feedback_responses',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        make_request
      }.to change { FeedbackResponse.count }.by(1)
      feedback_response = FeedbackResponse.last

      assert_payload(:feedback_response, feedback_response, json_item)
    end
  end
end
