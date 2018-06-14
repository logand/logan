require 'rails_helper'

RSpec.describe "feedback_responses#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/feedback_responses/#{feedback_response.id}"
  end

  describe 'basic destroy' do
    let!(:feedback_response) { create(:feedback_response) }

    it 'updates the resource' do
      expect {
        make_request
      }.to change { FeedbackResponse.count }.by(-1)

      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
